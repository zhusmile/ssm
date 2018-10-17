package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.TimeAxis;
import com.flf.service.TimeAxisService;

@Controller
@RequestMapping(value="/timeAxis")
public class TimeAxisController {
	@Autowired
	private TimeAxisService timeAxisService;
	@RequestMapping
	public ModelAndView getPage(TimeAxis timeAxis) {
		ModelAndView mv = new ModelAndView();
		List<TimeAxis> timeAxisList=timeAxisService.listPageTimeAxis(timeAxis);
		mv.setViewName("timeAxisAdmin/timeAxises");
		mv.addObject("timeAxis", timeAxis);
		mv.addObject("timeAxisList", timeAxisList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/timeAxisAdmin/timeAxis_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer tId) {
		ModelAndView mv = new ModelAndView();
		TimeAxis timeAxis=timeAxisService.getTimeAxisById(tId);
		mv.setViewName("timeAxisAdmin/timeAxis_info");
		mv.addObject("timeAxis", timeAxis);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(TimeAxis timeAxis) {
		ModelAndView mv = new ModelAndView();
		if(timeAxis.gettId()==null||timeAxis.gettId().intValue()==0) {
			if(timeAxisService.insertTimeAxis(timeAxis)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(timeAxisService.updateTimeAxis(timeAxis)){
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
		timeAxisService.deleteTimeAxis(list);
		out.write("success");
		out.close();
	}
}
