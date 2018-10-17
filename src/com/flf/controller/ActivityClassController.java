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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.ActivityClass;
import com.flf.entity.Area;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.ActivityClassService;
import com.flf.service.AreaService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/activityClass")
public class ActivityClassController {
	@Autowired
	private AreaService areaService;
	@Autowired
	private ActivityClassService activityClassService;
	@RequestMapping
	public ModelAndView getPage(ActivityClass activityClass) {
		ModelAndView mv = new ModelAndView();
		List<ActivityClass> activityClassList=activityClassService.listPageActivityClass(activityClass);
		mv.setViewName("activityClassAdmin/activityClasses");
		mv.addObject("activityClassList",activityClassList);
		mv.addObject("activityClass", activityClass);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddActivityClass(Model model) {
		System.out.println("toadd");
		List<Area> areaList=areaService.getAreaList();
		model.addAttribute("areaList", areaList);
		return "/activityClassAdmin/activityClass_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditActivityClass(@RequestParam Integer acId) {
		ModelAndView mv=new ModelAndView();
		System.out.println("toedit: acid "+acId);
		List<Area> areaList=areaService.getAreaList();
		ActivityClass activityClass=activityClassService.getActivityClassById(acId);
		System.out.println(activityClass.toString());
		mv.setViewName("activityClassAdmin/activityClass_info");
		mv.addObject("activityClass", activityClass);
		mv.addObject("areaList", areaList);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveActivityClass(ActivityClass activityClass,@RequestParam("file1")MultipartFile file1,@RequestParam("file2")MultipartFile file2,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(activityClass.toString());
		String filename1=null;
		String sqlPath1=null;
		String localPath1=null;
		String filename2=null;
		String sqlPath2=null;
		String localPath2=null;
		SavePath savePath = new SavePath();
		if(!file1.isEmpty()) {
			filename1=savePath.getFileName(file1);
			sqlPath1=savePath.getSqlPath();
			localPath1=savePath.getLocalPath();
			activityClass.setAcImg1(sqlPath1+filename1);
		}
		if(!file2.isEmpty()) {
			filename2=savePath.getFileName(file2);
			sqlPath2=savePath.getSqlPath();
			localPath2=savePath.getLocalPath();
			activityClass.setAcImg2(sqlPath2+filename2);
		}
		if(activityClass.getAcId()==null || activityClass.getAcId().intValue()==0) {
			activityClass.setAcIssuer(user.getLoginname());
			activityClass.setAcPublishTime(new Date());
			if(activityClassService.insertActivityClass(activityClass)) {
				file1.transferTo(new File(localPath1+filename1));
				file2.transferTo(new File(localPath2+filename2));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			activityClass.setAcModifier(user.getLoginname());
			activityClass.setAcModifyTime(new Date());
			if(activityClassService.updateActivityClass(activityClass)) {
				file1.transferTo(new File(localPath1+filename1));
				file2.transferTo(new File(localPath2+filename2));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
		}
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/enabled")
	public void toPublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		activityClassService.updateActivityClassEnabled(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unenabled")
	public void toUnEnabled(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		activityClassService.updateActivityClassUnEnabled(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteActivityClass(Integer[] list,PrintWriter out) {
		System.out.println("delete");
		System.out.println(list.length);
		activityClassService.deleteActivityClass(list);
		out.write("success");
		out.close();
	}
}
