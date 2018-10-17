package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


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
import com.flf.entity.Base;
import com.flf.entity.Dynamic;
import com.flf.entity.Institution;
import com.flf.entity.SavePath;
import com.flf.service.AreaService;
import com.flf.service.BaseService;
import com.flf.service.DynamicService;
import com.flf.service.InstitutionService;



@Controller
@RequestMapping(value="/dynamic")
public class DynamicController {
	@Autowired
	private DynamicService dynamicService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private BaseService baseService;
	@Autowired
	private InstitutionService institutionService;
	@RequestMapping
	public ModelAndView getPage(Dynamic dy) {
		ModelAndView mv = new ModelAndView();
		List<Dynamic> dyList=dynamicService.listPageDynamic(dy);
		mv.setViewName("dynamicAdmin/dynamics");
		mv.addObject("dyList",dyList);
		mv.addObject("dy", dy);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddDynamic(Model model) {
		System.out.println("toadd");
		List<Area> areaList=areaService.getAreaList();
		List<Institution> institutionList=institutionService.getInstitutionList();
		List<Base> baseList=baseService.getBaseList();
		model.addAttribute("areaList",areaList);
		model.addAttribute("baseList", baseList);
		model.addAttribute("institutionList", institutionList);
		return "/dynamicAdmin/dynamic_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditDynamic(@RequestParam Integer dyId) {
		ModelAndView mv=new ModelAndView();
		Dynamic dy=dynamicService.getDynamicById(dyId);
		mv.setViewName("/dynamicAdmin/dynamic_info");
		mv.addObject("dy", dy);
		List<Area> areaList=areaService.getAreaList();
		List<Base> baseList=baseService.getBaseList();
		List<Institution> institutionList=institutionService.getInstitutionList();
		mv.addObject("areaList", areaList);
		mv.addObject("baseList", baseList);
		for (Institution institution : institutionList) {
			System.out.println(institution.getInName());
		}
		mv.addObject("institutionList", institutionList);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveDynamic(Dynamic dy,@RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		System.out.println(dy.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			dy.setDyImg(sqlPath+filename);
		}
		if(dy.getDyId()==null || dy.getDyId().intValue()==0) {
			dy.setDyCreateTime(new Date());
			dynamicService.insertDynamic(dy);
			file.transferTo(new File(localPath+filename));
		}else {
			dynamicService.updateDynamic(dy);
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
		dynamicService.updateDynamicSetTop(list);
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
		dynamicService.updateDynamicSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/publish")
	public void toPublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		dynamicService.updateDynamicPublish(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		dynamicService.updateDynamicUnPublish(list);
		dynamicService.updateDynamicSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/ajax")
	@ResponseBody
	public List<Base> getBaseList(Integer dyArea) {
		System.out.println("ajax");
		System.out.println(dyArea);
		List<Base> baseListInArea = new ArrayList<Base>();
		if(dyArea!=null) {
			baseListInArea=baseService.getBaseListByArea(dyArea);
		}else {
			baseListInArea=baseService.getBaseList();
		}
		return baseListInArea;
	}
	@RequestMapping(value="/delete")
	public void deleteDynamics(Integer[] list,PrintWriter out){
		System.out.println("delete");
		System.out.println(list.length);
		dynamicService.deleteDynamic(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
