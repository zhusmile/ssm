package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.flf.entity.EntreGroup;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.EntreGroupService;
import com.flf.util.Const;


@Controller
@RequestMapping(value="/entreGroup")
public class EntreGroupController {
	@Autowired
	private EntreGroupService entreGroupService;
	/**
	 * 显示eg数据页面(查询后/不查询直接点开)
	 * @param entreGroup
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPageList(EntreGroup entreGroup) {
		ModelAndView mv = new ModelAndView();
		List<EntreGroup> egList=entreGroupService.listPageEntreGroup(entreGroup);
		mv.setViewName("entreGroups");
		mv.addObject("egList",egList);
		mv.addObject("eg", entreGroup);
		return mv;
	}
	@RequestMapping(value="/setTop")
	public void setTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		for (Integer entreGroupId : list) {
			System.out.println(entreGroupId);
			entreGroupService.updateEntreGroupSetTop(entreGroupId);
		}
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unsetTop")
	public void unsetTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		for (Integer entreGroupId : list) {
			System.out.println(entreGroupId);
			entreGroupService.updateEntreGroupSetunTop(entreGroupId);
		}
		out.write("success");
		out.close();
	}
	/**
	 * 前端点击新增按钮前往信息页面 entreGroup_info.jsp
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddentreGroup(Model model) {
		return "entreGroup_info";
	}
	/**
	 * 前端点击修改按钮前往信息页面 entreGroup_info.jsp
	 * @param entreGroupId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditentreGroup(@RequestParam Integer egId){
		System.out.println("toEditentreGroup");
		System.out.println(egId);
		ModelAndView mView = new ModelAndView();
		EntreGroup entreGroup=entreGroupService.getEntreGroupById(egId);
		System.out.println(entreGroup);
		mView.setViewName("entreGroup_info");
		mView.addObject("eg",entreGroup);
		return mView;
	}
	/**
	 * 新增和修改的结果保存
	 * @param entreGroup
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/save")
	public  ModelAndView saveEntreGroup(EntreGroup entreGroup,HttpSession session) throws IllegalStateException, IOException {
		String fileName=null;
		String sqlPath=null;
		String localPath=null;
		ModelAndView mv = new ModelAndView();
		SavePath savePath = new SavePath();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		String username=user.getLoginname();
		if(!entreGroup.getFile().isEmpty()) {
			fileName=savePath.getFileName(entreGroup.getFile());
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			entreGroup.setEgSrc(sqlPath+fileName);
		}
		if(entreGroup.getEgId()==null||entreGroup.getEgId().intValue()==0) {
			//新增
			entreGroup.setEgIssuer(username);
			entreGroup.setEgAddTime(new Date());
			entreGroup.setEgSetTop(2);
			if(entreGroupService.insertEntreGroup(entreGroup)) {
				if(!entreGroup.getFile().isEmpty()) {
					entreGroup.getFile().transferTo(new File(localPath+fileName));
				}
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}
		}else {
			//修改
			entreGroup.setEgModifier(username);
			entreGroup.setEgChangeTime(new Date());
			entreGroupService.updateEntreGroup(entreGroup);
			if(!entreGroup.getFile().isEmpty()) {
				entreGroup.getFile().transferTo(new File(localPath+fileName));
			}
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除信息(批量)
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteBanner(Integer[] list,PrintWriter out){
		System.out.println("deleteBanner");
		System.out.println(list.length);
		for (Integer egId : list) {
			System.out.println(egId);
			entreGroupService.deleteEntreGroupById(egId);
		}
		out.write("success");
		out.close();
	}
}
