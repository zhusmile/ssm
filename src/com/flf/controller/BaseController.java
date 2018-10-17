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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Area;
import com.flf.entity.Base;
import com.flf.entity.Institution;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.AreaService;
import com.flf.service.BaseService;
import com.flf.service.InstitutionService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/base")
public class BaseController {
	@Autowired
	private BaseService baseService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private InstitutionService institutionService;
	@RequestMapping
	public ModelAndView getPage(Base base) {
		System.out.println("toBaseHtml");
		ModelAndView mv = new ModelAndView();
		List<Base> baseList=baseService.listPageBase(base);
		System.out.println(baseList.size());
		mv.setViewName("baseAdmin/bases");
		mv.addObject("baseList",baseList);
		mv.addObject("base", base);
		return mv;
	}
	@RequestMapping(value="/toAdd")
	public ModelAndView toAddBase() {
		System.out.println("toadd");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("baseAdmin/base_info");
		getAreaListandInstitutionList(mv);
		return mv;
	}
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditBase(@RequestParam Integer bId) {
		ModelAndView mv=new ModelAndView();
		Base base=baseService.getBaseById(bId);
		mv.setViewName("/baseAdmin/base_info");
		getAreaListandInstitutionList(mv);
		mv.addObject("base", base);
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveBase(Base base,@RequestParam("file")MultipartFile file,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		System.out.println(base.toString());
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath = new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			base.setbFileSrc(sqlPath+filename);
		}
		if(base.getbId()==null || base.getbId().intValue()==0) {
			base.setbCreator(user.getLoginname());
			base.setbCreateTime(new Date());
			if(baseService.insertBase(base)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed");
			}
			
		}else {
			base.setbModifier(user.getLoginname());
			base.setbModifyTime(new Date());
			if(baseService.updateBase(base)) {
				file.transferTo(new File(localPath+filename));
				mv.addObject("msg","success");
			}else {
				mv.addObject("msg","failed1");
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
		baseService.updateBaseSetTop(list);
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
		baseService.updateBaseSetunTop(list);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	public void getAreaListandInstitutionList(ModelAndView mv) {
		List<Area> areas=areaService.getAreaList();
		List<Institution> institutions=institutionService.getInstitutionList();
		mv.addObject("areas", areas);
		mv.addObject("institutions", institutions);
	}
}

