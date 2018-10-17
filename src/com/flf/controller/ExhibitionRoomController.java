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

import com.flf.entity.ExhibitionRoom;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.ExhibitionRoomService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/exhibitionRoom")
public class ExhibitionRoomController {
	@Autowired
	private ExhibitionRoomService exhibitionRoomService;
	@RequestMapping
	public ModelAndView getPage(ExhibitionRoom exhibitionRoom) {
		ModelAndView mv = new ModelAndView();
		List<ExhibitionRoom> exhibitionRoomList=exhibitionRoomService.listPageExhibitionRoom(exhibitionRoom);
		System.out.println(exhibitionRoomList.size());
		mv.setViewName("exhibitionRoomAdmin/exhibitionRooms");
		mv.addObject("exhibitionRoomList",exhibitionRoomList);
		mv.addObject("exhibitionRoom", exhibitionRoom);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public String toAddExhibitionRoom(Model model) {
		System.out.println("toadd");
		return "/exhibitionRoomAdmin/exhibitionRoom_info";
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditExhibitionRoom(@RequestParam Integer mId) {
		ModelAndView mv=new ModelAndView();
		ExhibitionRoom exhibitionRoom=exhibitionRoomService.getExhibitionRoomById(mId);
		mv.setViewName("/exhibitionRoomAdmin/exhibitionRoom_info");
		mv.addObject("exhibitionRoom", exhibitionRoom);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveExhibitionRoom(ExhibitionRoom exhibitionRoom,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(exhibitionRoom.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			exhibitionRoom.setErImg(sqlPath+filename);
		}
		if(exhibitionRoom.getErId()==null || exhibitionRoom.getErId().intValue()==0) {
			exhibitionRoom.setErIssuer(user.getLoginname());
			exhibitionRoom.setErCreateTime(new Date());
			if(exhibitionRoomService.insertExhibitionRoom(exhibitionRoom)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
			
		}else {
			exhibitionRoom.setErModifier(user.getLoginname());
			exhibitionRoom.setErModifyTime(new Date());
			if(exhibitionRoomService.updateExhibitionRoom(exhibitionRoom)) {
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
		exhibitionRoomService.updateExhibitionRoomSetTop(list);
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
		exhibitionRoomService.updateExhibitionRoomSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unpublish")
	public void toUnpublish(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		exhibitionRoomService.updateExhibitionRoomUnPublish(list);
		exhibitionRoomService.updateExhibitionRoomSetUnTop(list);
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/delete")
	public void deleteExhibitionRoom(Integer[] list,PrintWriter out) {
		System.out.println("delete");
		System.out.println(list.length);
		exhibitionRoomService.deleteExhibitionRoom(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

