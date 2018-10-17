package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.PolicyClassfication;
import com.flf.service.PolicyClassficationService;

@Controller
@RequestMapping(value="/policyClassfication")
public class PolicyClassficationController {
	@Autowired
	private PolicyClassficationService policyClassficationService;
	@RequestMapping
	public ModelAndView getPage(PolicyClassfication policyClassfication) {
		ModelAndView mv = new ModelAndView();
		List<PolicyClassfication> policyClassficationList=policyClassficationService.listPagePolicyClassfication(policyClassfication);
		mv.setViewName("policyClassficationAdmin/policyClassfications");
		mv.addObject("policyClassfication", policyClassfication);
		mv.addObject("policyClassficationList", policyClassficationList);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "/policyClassficationAdmin/policyClassfication_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(@RequestParam Integer pId) {
		ModelAndView mv = new ModelAndView();
		PolicyClassfication policyClassfication=policyClassficationService.getPolicyClassficationById(pId);
		mv.setViewName("policyClassficationAdmin/policyClassfication_info");
		mv.addObject("policyClassfication", policyClassfication);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(PolicyClassfication policyClassfication) {
		ModelAndView mv = new ModelAndView();
		if(policyClassfication.getpId()==null||policyClassfication.getpId().intValue()==0) {
			if(policyClassficationService.insertPolicyClassfication(policyClassfication)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			if(policyClassficationService.updatePolicyClassfication(policyClassfication)){
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
		policyClassficationService.deletePolicyClassfication(list);
		out.write("success");
		out.close();
	}
}