package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Organization;
import com.flf.entity.SavePath;
import com.flf.service.OrgService;

@Controller
@RequestMapping(value="/org")
public class OrgController {
	@Autowired
	private OrgService orgService;
	
	/**
	 * 获取数据列表
	 * @param org
	 * @param code
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(Organization org,Integer code) {
		ModelAndView mv = new ModelAndView();
		org.setOrgType(code);
		System.out.println("orgcode:"+code);
		List<Organization> orgList=orgService.listPageOrganization(org);
		mv.setViewName("/orgAdmin/organizations");
		mv.addObject("orgList",orgList);
		mv.addObject("code", code);
		return mv;
	}
	/**
	 * 添加 
	 * @param code 代表信息类别
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddInfo(Integer code,Model model) {
		System.out.println("toAddInfo code:"+code);
		model.addAttribute("code", code);
		return "orgAdmin/organization_info";
	}
	/**
	 * 修改
	 * @param orgId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditOrg(@RequestParam Integer orgId) {
		System.out.println("toEdit id:"+orgId);
		ModelAndView mv = new ModelAndView();
		Organization org=orgService.getOrganizationById(orgId);
		mv.setViewName("/orgAdmin/organization_info");
		mv.addObject("org", org);
		return mv;
	}
	/**
	 * 保存添加/修改结果
	 * @param org 
	 * @param code
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveOrg(Organization org,Integer code) throws IllegalStateException, IOException {
		System.out.println("saveOrg code:"+code);
		ModelAndView mv=new ModelAndView();
		String fileName=null;
		String localPath=null;
		String sqlPath=null;
		org.setOrgSetTop(1);
		org.setOrgType(code);
		if(!org.getFile().isEmpty()) {
			SavePath savePath=new SavePath();
			fileName=savePath.getFileName(org.getFile());
			localPath=savePath.getLocalPath();
			sqlPath=savePath.getSqlPath();
			org.setOrgSrc(sqlPath+fileName);
		}
		if(org.getOrgId()==null || org.getOrgId().intValue()==0) {
			orgService.insertOrganization(org);
			if(fileName!=null) {
				org.getFile().transferTo(new File(localPath+fileName));
			}
		}else {
			orgService.updateOrganization(org);
			if(fileName!=null) {
				org.getFile().transferTo(new File(localPath+fileName));
			}
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除(可批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteInfo(Integer[] list,PrintWriter out) {
		orgService.deleteOrganization(list);
		out.write("success");
		out.close();
	}
	/**
	 * 	设置置顶(可批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/setTop")
	public void setTop(Integer[] list,PrintWriter out){
		orgService.updateOrganizationSetTop(list);
		out.write("success");
		out.close();
	}
	/**
	 * 取消置顶(可批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/unsetTop")
	public void unsetTop(Integer[] list,PrintWriter out){
		orgService.updateOrganizationSetUnTop(list);
		out.write("success");
		out.close();
	}
}
