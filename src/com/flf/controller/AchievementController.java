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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Achievement;
import com.flf.service.AchievementService;

@Controller
@RequestMapping(value="/achievement")
public class AchievementController {
	@Autowired
	private AchievementService achievementService;
	@RequestMapping
	public ModelAndView getPage(Achievement ac) {
		ModelAndView mv = new ModelAndView();
		System.out.println("getPage");
		System.out.println(ac.getAcPublish());
		System.out.println(ac.getAcSetTop());
		List<Achievement> acList=achievementService.listPageAchievement(ac);
		mv.setViewName("/achievementAdmin/achievements");
		mv.addObject("acList", acList);
		mv.addObject("ac", ac);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddAchievement() {
		return "/achievementAdmin/achievement_info";
	}
	/**
	 * 前往修改
	 * @param adId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditAchievement(@RequestParam Integer acId){
		System.out.println("toEditAchievement");
		System.out.println(acId);
		ModelAndView mView = new ModelAndView();
		Achievement ac=achievementService.getAchievementById(acId);
		mView.setViewName("/achievementAdmin/achievement_info");
		mView.addObject("ac",ac);
		return mView;
	}
	/**
	 * 保存增加或者修改的数据
	 * @param Achievement
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveAchievement(Achievement ac,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(ac.getAcId()==null ||ac.getAcId().intValue()==0) {
			System.out.println("insert");
			//设置未置顶
			ac.setAcSetTop(1);
			//设置创建时间
			ac.setAcCreateTime(new Date());
			//设置未发布
			ac.setAcPublish(1);
			if(achievementService.insertAchievement(ac)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}
		}else{
			System.out.println("update");
			if(achievementService.updateAchievement(ac)) {
				mv.addObject("msg", "success");
			}else {
				mv.addObject("msg", "failed");
			}
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
	public void deleteAchievement(Integer[] list,PrintWriter out){
		System.out.println("deleteAchievement");
		System.out.println(list.length);
		achievementService.deleteAchievement(list);
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
		achievementService.updateAcievementSetTop(list);
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
		achievementService.updateAchievementSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/publish")
	public void toPublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		achievementService.updateAchievementPublish(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		achievementService.updateAchievementUnPublish(list);
		achievementService.updateAchievementSetUnTop(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
