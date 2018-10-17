package com.flf.controller;


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
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Assessment;
import com.flf.entity.User;
import com.flf.service.AssessmentService;
import com.flf.util.Const;
@Controller
@RequestMapping(value="/assessment")
public class AssessmentController {
	@Autowired
	private AssessmentService assessmentService;
	@RequestMapping
	public ModelAndView getPage(Assessment assessment) {
		ModelAndView mv = new ModelAndView();
		List<Assessment> assessmentList=assessmentService.listPageAssessment(assessment);
		System.out.println(assessmentList.size());
		mv.setViewName("assessmentAdmin/assessments");
		mv.addObject("assessmentList",assessmentList);
		mv.addObject("assessment", assessment);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddAssessment(Model model) {
		System.out.println("toadd");
		return "/assessmentAdmin/assessment_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditAssessment(@RequestParam Integer aId) {
		ModelAndView mv=new ModelAndView();
		Assessment assessment=assessmentService.getAssessmentById(aId);
		mv.setViewName("/assessmentAdmin/assessment_info");
		mv.addObject("assessment", assessment);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveAssessment(Assessment assessment,HttpSession session){
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(assessment.toString());
		if(assessment.getaId()==null || assessment.getaId().intValue()==0) {
			assessment.setaCreator(user.getLoginname());
			assessment.setaCreateTime(new Date());
			if(assessmentService.insertAssessment(assessment)) {
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
			
		}else {
			assessment.setaModifier(user.getLoginname());
			assessment.setaModifyTime(new Date());
			if(assessmentService.updateAssessment(assessment)) {
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
		}
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/publish")
	public void unsetTop(Integer[] list,PrintWriter out){
		System.out.println("publsih");
		System.out.println(list.length);
		assessmentService.updateAssessmentPublish(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		assessmentService.updateAssessmentUnPublish(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteAssessment(Integer[] list,PrintWriter out) {
		System.out.println("delete");
		System.out.println(list.length);
		assessmentService.deleteAssessment(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
