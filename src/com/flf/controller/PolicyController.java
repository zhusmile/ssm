package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Area;
import com.flf.entity.Ecosphere;
import com.flf.entity.EntreGroup;
import com.flf.entity.Policy;
import com.flf.entity.PolicyClassfication;
import com.flf.entity.Industry;
import com.flf.entity.Institution;
import com.flf.entity.SavePath;
import com.flf.entity.SubjectClassfication;
import com.flf.entity.TimeAxis;
import com.flf.entity.User;
import com.flf.service.AreaService;
import com.flf.service.EcosphereService;
import com.flf.service.EntreGroupService;
import com.flf.service.IndustryService;
import com.flf.service.InstitutionService;
import com.flf.service.PolicyClassficationService;
import com.flf.service.PolicyService;
import com.flf.service.SubjectClassficationService;
import com.flf.service.TimeAxisService;
import com.flf.util.Const;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/policy")
public class PolicyController {
	@Autowired
	private PolicyService policyService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private InstitutionService institutionService;
	@Autowired
	private IndustryService industryService;
	@Autowired
	private SubjectClassficationService subjectClassficationService;
	@Autowired
	private TimeAxisService timeAxisService;
	@Autowired
	private PolicyClassficationService policyClassficationService;
	@Autowired 
	private EntreGroupService entreGroupService;
	@Autowired
	private EcosphereService ecosphereService;
	@RequestMapping
	public ModelAndView getPage(Policy policy) {
		System.out.println(policy.toString());
		List<Policy> pList=policyService.listPagePolicy(policy);
		List<Area> aList=areaService.getAreaList();
		List<Industry> iList=industryService.getIndustryList();
		List<SubjectClassfication> sList=subjectClassficationService.getSubList();
		List<Institution> inList=institutionService.getInstitutionList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("policyAdmin/policy");
		mv.addObject("pList",pList);
		mv.addObject("aList", aList);
		mv.addObject("iList",iList);
		mv.addObject("sList", sList);
		mv.addObject("inList",inList);
		mv.addObject("policy", policy);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddPolicy(Model model) {
		System.out.println("toadd");
		return "/policyAdmin/policy_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditPolicy(@RequestParam Integer pId) {
		ModelAndView mv=new ModelAndView();
		Policy policy=policyService.getPolicyById(pId);
		System.out.println(policy.toString());
		mv.setViewName("/policyAdmin/policy_info");
		mv.addObject("policy", policy);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView savePolicy(Policy policy,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		System.out.println(policy.toString());
		User user=(User) session.getAttribute(Const.SESSION_USER);
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			policy.setpInterviewImg(sqlPath+filename);
		}
		if(policy.getpId()==null || policy.getpId().intValue()==0) {
			policy.setpIssuer(user.getLoginname());
			
			if(policyService.insertPolicy(policy)) {
				mv.addObject("msg", "success");
				file.transferTo(new File(localPath+filename));
			}else {
				mv.addObject("msg", "failed");
			}
		
		}else {
			policy.setpModifier(user.getLoginname());
			policy.setpModifyTime(new Date());
			if(policyService.updatePolicy(policy)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed1");
			}
			
		}
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/delete")
	public void deletePolicy(Integer[] list,PrintWriter out) {
		System.out.println("delete");
		policyService.deletePolicy(list);
		out.write("success");
		out.close();
	}
	/**
	 * 批量设置置顶
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/setTop")
	public void setTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		policyService.updatePolicySetTop(list);
		out.write("success");
		out.close();
	}
	/**
	 * 批量设置取消置顶
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/unsetTop")
	public void unsetTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		policyService.updatePolicySetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/publish")
	public void toPublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		policyService.updatePolicyPublish(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		policyService.updatePolicyUnPublish(list);
		policyService.updatePolicySetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/issueOrg")
	@ResponseBody
	public void getIssueOrgList(HttpServletResponse response) throws IOException {
		List<Institution> institutions=institutionService.getInstitutionList();
		JSONArray jsonArray=JSONArray.fromObject(institutions);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/theClassfication")
	@ResponseBody
	public void getTheClassfication(HttpServletResponse response) throws IOException {
		List<SubjectClassfication> subjectClassfications=subjectClassficationService.getSubList();
		JSONArray jsonArray=JSONArray.fromObject(subjectClassfications);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/ecosphere")
	@ResponseBody
	public void getEcosphere(HttpServletResponse response) throws IOException {
		List<Ecosphere> ecospheres=ecosphereService.listPageEcosphere(new Ecosphere());
		JSONArray jsonArray=JSONArray.fromObject(ecospheres);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/timeAxis")
	@ResponseBody
	public void getTimeAxis(HttpServletResponse response) throws IOException {
		List<TimeAxis> timeAxis=timeAxisService.listPageTimeAxis(new TimeAxis());
		JSONArray jsonArray=JSONArray.fromObject(timeAxis);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/area")
	@ResponseBody
	public void getArea(HttpServletResponse response) throws IOException {
		List<Area> areas=areaService.getAreaList();
		JSONArray jsonArray=JSONArray.fromObject(areas);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/policyClassfication")
	@ResponseBody
	public void getPolicyClassfication(HttpServletResponse response) throws IOException {
		List<PolicyClassfication> pClassfications=policyClassficationService.listPagePolicyClassfication(new PolicyClassfication());
		JSONArray jsonArray=JSONArray.fromObject(pClassfications);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/entreGroup")
	@ResponseBody
	public void getEntreGroup(HttpServletResponse response) throws IOException {
		List<EntreGroup> entreGroups=entreGroupService.listPageEntreGroup(new EntreGroup());
		JSONArray jsonArray=JSONArray.fromObject(entreGroups);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@RequestMapping(value="/industry")
	@ResponseBody
	public void getIndustry(HttpServletResponse response) throws IOException {
		List<Industry> industries=industryService.getIndustryList();
		JSONArray jsonArray=JSONArray.fromObject(industries);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
