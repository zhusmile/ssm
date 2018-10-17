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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.IndustrialPark;
import com.flf.entity.SavePath;
import com.flf.service.IndustrialParkService;


//政策管理-产业园推荐
@Controller
@RequestMapping(value="/industrialPark")
public class IndustrialParkController {
	@Autowired
	private IndustrialParkService industrialParkService;
	@RequestMapping
	public ModelAndView getPage(IndustrialPark industrialPark) {
		ModelAndView mv = new ModelAndView();
		List<IndustrialPark> ipList=industrialParkService.listPageIndustrialPark(industrialPark);
		mv.setViewName("/industrialParkAdmin/industrialParks");
		mv.addObject("ipList",ipList);
		mv.addObject("ip",industrialPark);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddInfo(Model model) {
		return "industrialParkAdmin/industrialPark_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditIndustrialPark(@RequestParam Integer ipId) {
		System.out.println("toEdit id:"+ipId);
		ModelAndView mv = new ModelAndView();
		IndustrialPark industrialPark=industrialParkService.getIndustrialParkById(ipId);
		mv.setViewName("/industrialParkAdmin/industrialPark_info");
		mv.addObject("ip", industrialPark);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveIndustrialPark(IndustrialPark industrialPark,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		String fileName=null;
		String localPath=null;
		String sqlPath=null;
		if(!file.isEmpty()) {
			SavePath savePath=new SavePath();
			fileName=savePath.getFileName(file);
			localPath=savePath.getLocalPath();
			sqlPath=savePath.getSqlPath();
			industrialPark.setIpImg(sqlPath+fileName);
		}
		if(industrialPark.getIpId()==null || industrialPark.getIpId().intValue()==0) {
			if(industrialParkService.insertIndustrialPark(industrialPark)) {
				if(fileName!=null) {
					file.transferTo(new File(localPath+fileName));
				}
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}

		}else {
			if(industrialParkService.updateIndustrialPark(industrialPark)) {
				if(fileName!=null) {
					file.transferTo(new File(localPath+fileName));
				}
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed1");
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
		industrialParkService.deleteIndustrialPark(list);
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
		industrialParkService.updateIndustrialParkSetTop(list);
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
		industrialParkService.updateIndustrialParkSetUnTop(list);
		out.write("success");
		out.close();
	}
}