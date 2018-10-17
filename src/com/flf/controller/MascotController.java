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

import com.flf.entity.Mascot;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.MascotService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/mascot")
public class MascotController {
	@Autowired
	private MascotService mascotService;
	@RequestMapping
	public ModelAndView getPage(Mascot mascot) {
		ModelAndView mv = new ModelAndView();
		List<Mascot> mascotList=mascotService.listPageMascot(mascot);
		System.out.println(mascotList.size());
		mv.setViewName("mascotAdmin/mascots");
		mv.addObject("mascotList",mascotList);
		mv.addObject("mascot", mascot);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddMascot(Model model) {
		System.out.println("toadd");
		return "/mascotAdmin/mascot_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditMascot(@RequestParam Integer mId) {
		ModelAndView mv=new ModelAndView();
		Mascot mascot=mascotService.getMascotById(mId);
		mv.setViewName("/mascotAdmin/mascot_info");
		mv.addObject("mascot", mascot);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveMascot(Mascot mascot,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(mascot.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			mascot.setmImg(sqlPath+filename);
		}
		if(mascot.getmId()==null || mascot.getmId().intValue()==0) {
			mascot.setmIssuer(user.getLoginname());
			mascot.setmCreateTime(new Date());
			if(mascotService.insertMascot(mascot)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
			
		}else {
			mascot.setmModifier(user.getLoginname());
			mascot.setmModifyTime(new Date());
			if(mascotService.updateMascot(mascot)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg","success");
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
		mascotService.updateMascotSetTop(list);
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
		mascotService.updateMascotSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		mascotService.updateMascotUnPublish(list);
		mascotService.updateMascotSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteMascot(Integer[] list,PrintWriter out) {
		System.out.println("delete");
		System.out.println(list.length);
		mascotService.deleteMascot(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
