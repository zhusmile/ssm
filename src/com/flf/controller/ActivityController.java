package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Area;
import com.flf.entity.Activity;
import com.flf.entity.Institution;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.ActivityService;
import com.flf.service.AreaService;
import com.flf.service.InstitutionService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private InstitutionService institutionService;
	@RequestMapping
	public ModelAndView getPage(Activity ac) {
		ModelAndView mv = new ModelAndView();
		List<Activity> acList=activityService.listPageActivity(ac);
		System.out.println(acList.size());
//		for(Activity a:acList) {
//			System.out.println(a.toString());
//		}
		mv.setViewName("activityAdmin/activities");
		mv.addObject("acList",acList);
		List<Area> areaList=areaService.getAreaList();
		mv.addObject("ac", ac);
		mv.addObject("areaList", areaList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddActivity(Model model) {
		System.out.println("toadd");
		List<Area> areaList=areaService.getAreaList();
		List<Institution> institutionList=institutionService.getInstitutionList();
		model.addAttribute("areaList",areaList);
		model.addAttribute("institutionList", institutionList);
		return "/activityAdmin/activity_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditActivity(@RequestParam Integer aId) {
		ModelAndView mv=new ModelAndView();
		Activity ac=activityService.getActivityById(aId);
		List<Institution> institutionList=institutionService.getInstitutionList();
		mv.setViewName("/activityAdmin/activity_info");
		mv.addObject("ac", ac);
		List<Area> areaList=areaService.getAreaList();
		mv.addObject("areaList", areaList);
		mv.addObject("institutionList", institutionList);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveActivity(Activity ac,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(ac.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			ac.setaImg(sqlPath+filename);
		}
		if(ac.getaId()==null || ac.getaId().intValue()==0) {
			ac.setaSetTop(1);
			ac.setaPublish(0);
			ac.setaIssuer(user.getLoginname());
			ac.setaCreateTime(new Date());
			activityService.insertActivity(ac);
			file.transferTo(new File(localPath+filename));
		}else {
			ac.setaModifier(user.getLoginname());
			ac.setaModifyTime(new Date());
			activityService.updateActivity(ac);
			file.transferTo(new File(localPath+filename));
		}
		mv.setViewName("save_result");
		return mv;
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
		activityService.updateActivitySetTop(list);
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
		activityService.updateActivitySetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		activityService.updateActivityUnPublish(list);
		activityService.updateActivitySetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteActivity(Integer[] list,PrintWriter out) {
		activityService.deleteActivity(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
