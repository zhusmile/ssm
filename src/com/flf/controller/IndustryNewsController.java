package com.flf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.IndustryNews;
import com.flf.service.IndustryNewsService;



@Controller
@RequestMapping(value="/industryNews")
public class IndustryNewsController {
	@Autowired
	private IndustryNewsService industryNewsService;
	@RequestMapping
	public ModelAndView getPage(IndustryNews industryNews) {
		ModelAndView mv = new ModelAndView();
		List<IndustryNews> industryNewsList=industryNewsService.listPageIndustryNews(industryNews);
		mv.setViewName("/industryNewsAdmin/industryNews");
		mv.addObject("industryNewsList",industryNewsList);
		return mv;
	}
	/**
	 * 添加 
	 * @param code 代表信息类别
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddInfo(Model model) {
		return "industryNewsAdmin/industryNews_info";
	}
	/**
	 * 修改
	 * @param industryNewsId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditIndustryNews(@RequestParam Integer inId) {
		System.out.println("toEdit id:"+inId);
		ModelAndView mv = new ModelAndView();
		IndustryNews industryNews=industryNewsService.getIndustryNewsById(inId);
		mv.setViewName("/industryNewsAdmin/industryNews_info");
		mv.addObject("industryNews", industryNews);
		return mv;
	}
	/**
	 * 保存添加/修改结果
	 * @param industryNews 
	 * @param code
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveIndustryNews(IndustryNews industryNews){
		ModelAndView mv=new ModelAndView();
		if(industryNews.getInId()==null || industryNews.getInId().intValue()==0) {
			industryNews.setInCreateTime(new Date());
			if(industryNewsService.insertIndustryNews(industryNews)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}
		}else {
			industryNews.setInModifyTime(new Date());
			if(industryNewsService.updateIndustryNews(industryNews)){
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
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
		industryNewsService.deleteIndustryNews(list);
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
		industryNewsService.updateIndustryNewsSetTop(list);
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
		industryNewsService.updateIndustryNewsSetUnTop(list);
		out.write("success");
		out.close();
	}
	/**
	 * 发布(批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/publish")
	public void publish(Integer[] list,PrintWriter out){
		industryNewsService.updateIndustryNewsPublish(list);
		out.write("success");
		out.close();
	}
	/**
	 * 取消发布(批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/unpublish")
	public void unpublish(Integer[] list,PrintWriter out){
		industryNewsService.updateIndustryNewsUnPublish(list);
		industryNewsService.updateIndustryNewsSetUnTop(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}	
