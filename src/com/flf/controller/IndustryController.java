package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Industry;
import com.flf.service.IndustryService;

@Controller
@RequestMapping(value="/industry")
public class IndustryController {
	@Autowired
	private IndustryService industryService;
	@RequestMapping
	public ModelAndView getPage(Industry industry) {
		ModelAndView mv = new ModelAndView();
		List<Industry> industryList=industryService.listPageIndustry(industry);
		mv.setViewName("industryAdmin/industries");
		mv.addObject("industry", industry);
		mv.addObject("industryList", industryList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/industryAdmin/industry_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer iId) {
		ModelAndView mv = new ModelAndView();
		Industry industry=industryService.getIndustryById(iId);
		mv.setViewName("industryAdmin/industry_info");
		mv.addObject("industry", industry);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(Industry industry) {
		ModelAndView mv = new ModelAndView();
		if(industry.getiId()==null||industry.getiId().intValue()==0) {
			if(industryService.insertIndustry(industry)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(industryService.updateIndustry(industry)){
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed1");
			}
		}
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/delete")
	public void deleteBanner(Integer[] list,PrintWriter out){
		industryService.deleteIndustry(list);
		out.write("success");
		out.close();
	}
}