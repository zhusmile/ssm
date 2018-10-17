package com.flf.controller;

import java.io.PrintWriter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Information;
import com.flf.service.InfoService;

@Controller
@RequestMapping(value="/info")
public class InformationController {
	@Autowired
	private InfoService infoService;
	/**
	 * 获取信息
	 * @param info
	 * @param code 类别码
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(Information info,Integer code) {
		ModelAndView mv = new ModelAndView();
		System.out.println("infocode:"+code);
		info.setInfoType(code);
		List<Information> infoList=infoService.listPageInformation(info);
		mv.setViewName("/infoAdmin/informations");
		mv.addObject("infoList",infoList);
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
		return "infoAdmin/information_info";
	}
	/**
	 * 修改
	 * @param infoId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditInfo(@RequestParam Integer infoId) {
		System.out.println("toEdit id:"+infoId);
		ModelAndView mv = new ModelAndView();
		Information info=infoService.getInformationById(infoId);
		mv.setViewName("/infoAdmin/information_info");
		mv.addObject("info", info);
		return mv;
	}
	/**
	 * 保存添加/修改结果
	 * @param info
	 * @param code
	 * @return
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveInfo(Information info,Integer code) {
		System.out.println("saveInfo code:"+code);
		ModelAndView mv=new ModelAndView();
		if(info.getInfoId()==null || info.getInfoId().intValue()==0) {
			info.setInfoType(code);
			info.setInfoSetTop(1);
			infoService.insertInformation(info);
		}else {
			infoService.updateInformation(info);
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
		infoService.deleteInformation(list);
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
		infoService.updateInformationSetTop(list);
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
		infoService.updateInformationSetUnTop(list);
		out.write("success");
		out.close();
	}
}
