package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.GeneralAdvert;
import com.flf.entity.SavePath;
import com.flf.service.GeneralAdvertService;



@Controller
@RequestMapping(value="/generalAdvert")
public class GeneralAdvertController {
	@Autowired
	private GeneralAdvertService generalAdvertService;
	
	/**
	 * 获取数据列表
	 * @param generalAdvert
	 * @param code
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(GeneralAdvert generalAdvert,Integer code) {
		ModelAndView mv = new ModelAndView();
		generalAdvert.setGaType(code);
		System.out.println("generalAdvertcode:"+code);
		List<GeneralAdvert> gaList=generalAdvertService.listPageGeneralAdvert(generalAdvert);
		mv.setViewName("/generalAdvertAdmin/generalAdverts");
		mv.addObject("gaList",gaList);
		mv.addObject("ga", generalAdvert);
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
		return "generalAdvertAdmin/generalAdvert_info";
	}
	/**
	 * 修改
	 * @param generalAdvertId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditGeneralAdvert(@RequestParam Integer generalAdvertId) {
		System.out.println("toEdit id:"+generalAdvertId);
		ModelAndView mv = new ModelAndView();
		GeneralAdvert generalAdvert=generalAdvertService.getGeneralAdvertById(generalAdvertId);
		mv.setViewName("/generalAdvertAdmin/generalAdvert_info");
		mv.addObject("generalAdvert", generalAdvert);
		return mv;
	}
	/**
	 * 保存添加/修改结果
	 * @param generalAdvert 
	 * @param code
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveGeneralAdvert(GeneralAdvert generalAdvert,Integer code) throws IllegalStateException, IOException {
		System.out.println("saveGeneralAdvert code:"+code);
		ModelAndView mv=new ModelAndView();
		String fileName=null;
		String localPath=null;
		String sqlPath=null;
		generalAdvert.setGaSetTop(1);
		generalAdvert.setGaType(code);
		if(!generalAdvert.getFile().isEmpty()) {
			SavePath savePath=new SavePath();
			fileName=savePath.getFileName(generalAdvert.getFile());
			localPath=savePath.getLocalPath();
			sqlPath=savePath.getSqlPath();
			generalAdvert.setGaSrc(sqlPath+fileName);
		}
		if(generalAdvert.getGaId()==null || generalAdvert.getGaId().intValue()==0) {
			generalAdvertService.insertGeneralAdvert(generalAdvert);
			if(fileName!=null) {
				generalAdvert.getFile().transferTo(new File(localPath+fileName));
			}
		}else {
			generalAdvertService.updateGeneralAdvert(generalAdvert);
			if(fileName!=null) {
				generalAdvert.getFile().transferTo(new File(localPath+fileName));
			}
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
		generalAdvertService.deleteGeneralAdvert(list);
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
		generalAdvertService.updateGeneralAdvertSetTop(list);
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
		generalAdvertService.updateGeneralAdvertSetUnTop(list);
		out.write("success");
		out.close();
	}
}