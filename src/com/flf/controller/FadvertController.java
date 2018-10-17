package com.flf.controller;


import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.flf.entity.Fadvert;
import com.flf.service.FadvertService;

@Controller
@RequestMapping(value="/fadvert")
public class FadvertController {
	@Autowired
	private FadvertService fadvertService;
	
	/**
	 * 获取数据列表
	 * @param Fadvert
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(Fadvert fadvert) {
		ModelAndView mv = new ModelAndView();
		List<Fadvert> faList=fadvertService.listPageFadvert(fadvert);
		mv.setViewName("/fadvertAdmin/fadverts");
		mv.addObject("faList",faList);
		mv.addObject("fa", fadvert);
		return mv;
	}
	/**
	 * 前往新增
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddFadvert() {
		return "/fadvertAdmin/fadvert_info";
	}
	/**
	 * 前往修改
	 * @param adId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditFadvert(@RequestParam Integer fId){
		System.out.println("toEditentreGroup");
		System.out.println(fId);
		ModelAndView mView = new ModelAndView();
		Fadvert fadvert=fadvertService.getFadvertById(fId);
		mView.setViewName("/fadvertAdmin/fadvert_info");
		mView.addObject("fa",fadvert);
		return mView;
	}
	/**
	 * 保存增加或者修改的数据
	 * @param Fadvert
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveFadvert(Fadvert fadvert,HttpSession session) {
//		System.out.println(fadvert.getfId());
		ModelAndView mv = new ModelAndView();
		if(fadvert.getfId()==null ||fadvert.getfId().intValue()==0) {
			fadvert.setfSetTop(1);
//			System.out.println("insert");
			fadvertService.insertFadvert(fadvert);
		}else{
			System.out.println("update");
			fadvertService.updateFadvert(fadvert);
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除数据(批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteFadvert(Integer[] list,PrintWriter out){
		System.out.println("deleteFadvert");
		System.out.println(list.length);
		fadvertService.deleteFadvert(list);
		out.write("success");
		out.close();
	}
	/**
	 * 批量设置置顶
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/setTop")
	public void setTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		fadvertService.updateFadvertSetTop(list);
		out.write("success");
		out.close();
	}
	/**
	 * 批量设置取消置顶
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/unsetTop")
	public void unsetTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		fadvertService.updateFadvertsetUntop(list);
		out.write("success");
		out.close();
	}
}