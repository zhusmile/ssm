package com.flf.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Guest;
import com.flf.entity.ActivityClass;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.ActivityClassService;
import com.flf.service.GuestService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	@Autowired
	private GuestService guestService;
	@Autowired
	private ActivityClassService activityClassService;
	@RequestMapping
	public ModelAndView getPage(Guest guest) {
		ModelAndView mv = new ModelAndView();
		List<Guest> guestList=guestService.listPageGuest(guest);
		System.out.println(guestList.size());
		mv.setViewName("guestAdmin/guests");
		mv.addObject("guestList",guestList);
		mv.addObject("guest", guest);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddGuest(Model model) {
		System.out.println("toadd");
		List<ActivityClass> acList=activityClassService.getActivityClassList();
		System.out.println(acList.size());
		model.addAttribute("acList",acList);
		return "/guestAdmin/guest_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditGuest(@RequestParam Integer gId) {
		ModelAndView mv=new ModelAndView();
		Guest guest=guestService.getGuestById(gId);
		mv.setViewName("/guestAdmin/guest_info");
		List<ActivityClass> acList=activityClassService.getActivityClassList();
		System.out.println(acList.size());
		mv.addObject("acList",acList);
		mv.addObject("guest", guest);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveGuest(Guest guest,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(guest.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			guest.setgImg(sqlPath+filename);
		}
		if(guest.getgId()==null || guest.getgId().intValue()==0) {
			guest.setgSetTop(1);
			guest.setgIssuer(user.getLoginname());
			guest.setgCreateTime(new Date());
			if(guestService.insertGuest(guest)) {
				mv.addObject("msg","success");
				file.transferTo(new File(localPath+filename));
			}else {
				mv.addObject("msg","failed");
			}
		}else {
			guest.setgModifier(user.getLoginname());
			guest.setgModifyTime(new Date());
			if(guestService.updateGuest(guest)) {
				mv.addObject("msg","success");
				file.transferTo(new File(localPath+filename));
			}else {
				mv.addObject("msg","failed");
			}
		}
		mv.setViewName("save_result");
		return mv;
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
		guestService.updateGuestSetTop(list);
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
		guestService.updateGuestSetunTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		guestService.updateGuestUnpublish(list);
		guestService.updateGuestSetunTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteGuest(Integer[] list,PrintWriter out) {
		guestService.deleteGuest(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
