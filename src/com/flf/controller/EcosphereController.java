package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Ecosphere;
import com.flf.service.EcosphereService;

@Controller
@RequestMapping(value="/ecosphere")
public class EcosphereController {
	@Autowired
	private EcosphereService ecosphereService;
	@RequestMapping
	public ModelAndView getPage(Ecosphere ecosphere) {
		ModelAndView mv = new ModelAndView();
		List<Ecosphere> ecosphereList=ecosphereService.listPageEcosphere(ecosphere);
		mv.setViewName("ecosphereAdmin/ecospheres");
		mv.addObject("ecosphere", ecosphere);
		mv.addObject("ecosphereList", ecosphereList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/ecosphereAdmin/ecosphere_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer eId) {
		ModelAndView mv = new ModelAndView();
		Ecosphere ecosphere=ecosphereService.getEcosphereById(eId);
		mv.setViewName("ecosphereAdmin/ecosphere_info");
		mv.addObject("ecosphere", ecosphere);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(Ecosphere ecosphere) {
		ModelAndView mv = new ModelAndView();
		if(ecosphere.geteId()==null||ecosphere.geteId().intValue()==0) {
			if(ecosphereService.insertEcosphere(ecosphere)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(ecosphereService.updateEcosphere(ecosphere)){
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
		ecosphereService.deleteEcosphere(list);
		out.write("success");
		out.close();
	}
}
