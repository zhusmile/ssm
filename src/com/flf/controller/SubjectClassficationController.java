package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.SubjectClassfication;
import com.flf.service.SubjectClassficationService;

@Controller
@RequestMapping(value="/subjectClassfication")
public class SubjectClassficationController {
	@Autowired
	private SubjectClassficationService subjectClassficationService;
	@RequestMapping
	public ModelAndView getPage(SubjectClassfication subjectClassfication) {
		ModelAndView mv = new ModelAndView();
		List<SubjectClassfication> subjectClassficationList=subjectClassficationService.listPageSubjectClassfication(subjectClassfication);
		mv.setViewName("subjectClassficationAdmin/subjectClassfications");
		mv.addObject("subjectClassfication", subjectClassfication);
		mv.addObject("subjectClassficationList", subjectClassficationList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/subjectClassficationAdmin/subjectClassfication_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer sId) {
		ModelAndView mv = new ModelAndView();
		SubjectClassfication subjectClassfication=subjectClassficationService.getSubjectClassficationById(sId);
		mv.setViewName("subjectClassficationAdmin/subjectClassfication_info");
		mv.addObject("subjectClassfication", subjectClassfication);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(SubjectClassfication subjectClassfication) {
		ModelAndView mv = new ModelAndView();
		if(subjectClassfication.getsId()==null||subjectClassfication.getsId().intValue()==0) {
			if(subjectClassficationService.insertSubjectClassfication(subjectClassfication)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(subjectClassficationService.updateSubjectClassfication(subjectClassfication)){
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
		subjectClassficationService.deleteSubjectClassfication(list);
		out.write("success");
		out.close();
	}
}
