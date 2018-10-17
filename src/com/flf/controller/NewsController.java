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

import com.flf.entity.News;
import com.flf.service.NewsService;



@Controller
@RequestMapping(value="/news")
public class NewsController {
	@Autowired
	private NewsService newsService;
	@RequestMapping
	public ModelAndView getPage(News news,Integer code) {
		ModelAndView mv = new ModelAndView();
		news.setnType(code);
		System.out.println("newscode:"+code);
		List<News> newsList=newsService.listPageNews(news);
		mv.setViewName("/newsAdmin/news");
		mv.addObject("newsList",newsList);
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
		return "newsAdmin/news_info";
	}
	/**
	 * 修改
	 * @param newsId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditNews(@RequestParam Integer nId) {
		System.out.println("toEdit id:"+nId);
		ModelAndView mv = new ModelAndView();
		News news=newsService.getNewsById(nId);
		mv.setViewName("/newsAdmin/news_info");
		mv.addObject("news", news);
		return mv;
	}
	/**
	 * 保存添加/修改结果
	 * @param news 
	 * @param code
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveNews(News news,Integer code){
		System.out.println("saveNews code:"+code);
		ModelAndView mv=new ModelAndView();
		news.setnType(code);
		if(news.getnId()==null || news.getnId().intValue()==0) {
			news.setnCreateTime(new Date());
			if(newsService.insertNews(news)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}
		}else {
			news.setnModifyTime(new Date());
			if(newsService.updateNews(news)){
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed1");
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
		newsService.deleteNews(list);
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
		newsService.updateNewsSetTop(list);
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
		newsService.updateNewsSetUnTop(list);
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
		newsService.updateNewsPublish(list);
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
		newsService.updateNewsUnPublish(list);
		newsService.updateNewsSetUnTop(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}	
