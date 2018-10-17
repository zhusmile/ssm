package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.State;
import com.flf.service.StateService;

@Controller
@RequestMapping(value="/state")
public class StateController {
	@Autowired
	private StateService stateService;
	@RequestMapping
	public ModelAndView getPage(State state) {
		ModelAndView mView=new ModelAndView();
		List<State> states=stateService.listPageState(state);
		mView.setViewName("stateAdmin/states");
		mView.addObject("states", states);
		mView.addObject("state", state);
		return mView;
	}
	@RequestMapping(value="/toAudit")
	public ModelAndView toAuditing(Integer sId) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("stateAdmin/state_info");
		mView.addObject("state", stateService.getStateById(sId));
		return mView;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(State state){
		System.out.println(state.getsStatus());
		ModelAndView mView = new ModelAndView();
		stateService.updateStateStatus(state);
		mView.setViewName("save_result");
		return mView;
	}
	@RequestMapping(value="/delete")
	public void delete(Integer[] list,PrintWriter out) {
		System.out.println(list.length);
		stateService.deleteStateById(list);
		out.write("success");
		out.close();
	}
	
}
