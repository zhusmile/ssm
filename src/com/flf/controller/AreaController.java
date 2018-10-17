package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Area;
import com.flf.service.AreaService;

@Controller
@RequestMapping(value="/area")
public class AreaController {
	@Autowired
	private AreaService areaService;
	@RequestMapping
	public ModelAndView getPage(Area area) {
		ModelAndView mv = new ModelAndView();
		List<Area> areaList=areaService.listPageArea(area);
		mv.setViewName("areaAdmin/areas");
		mv.addObject("area", area);
		mv.addObject("areaList", areaList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/areaAdmin/area_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer aId) {
		ModelAndView mv = new ModelAndView();
		Area area=areaService.getAreaById(aId);
		mv.setViewName("areaAdmin/area_info");
		mv.addObject("area", area);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(Area area) {
		ModelAndView mv = new ModelAndView();
		if(area.getaId()==null||area.getaId().intValue()==0) {
			if(areaService.insertArea(area)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(areaService.updateArea(area)){
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
		areaService.deleteArea(list);
		out.write("success");
		out.close();
	}
}
