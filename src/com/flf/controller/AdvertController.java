package com.flf.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Advert;
import com.flf.entity.SavePath;
import com.flf.entity.User;
import com.flf.service.AdvertService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/advert")
public class AdvertController {
	@Autowired
	private AdvertService advertService;
	
	/**
	 * 获取数据列表
	 * @param advert
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(Advert advert) {
		ModelAndView mv = new ModelAndView();
		List<Advert> adList=advertService.listPageAdvert(advert);
		mv.setViewName("/advertAdmin/adverts");
		mv.addObject("adList",adList);
		mv.addObject("ad", advert);
		return mv;
	}
	/**
	 * 前往新增
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddAdvert() {
		return "/advertAdmin/advert_info";
	}
	/**
	 * 前往修改
	 * @param adId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditAdvert(@RequestParam Integer adId){
		System.out.println("toEditentreGroup");
		System.out.println(adId);
		ModelAndView mView = new ModelAndView();
		Advert advert=advertService.getAdvertById(adId);
		mView.setViewName("/advertAdmin/advert_info");
		mView.addObject("ad",advert);
		return mView;
	}
	/**
	 * 保存增加或者修改的数据
	 * @param advert
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveAdvert(Advert advert,HttpSession session) throws IllegalStateException, IOException {
		System.out.println(advert.getAdId());
		ModelAndView mv = new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath=new SavePath();
		if(!advert.getFile().isEmpty()) {
			filename=savePath.getFileName(advert.getFile());
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			advert.setAdSrc(sqlPath+filename);
		}
		if(advert.getAdId()==null ||advert.getAdId().intValue()==0) {
			advert.setAdIssuer(user.getLoginname());
			advert.setAdAddTime(new Date());
			advert.setAdSetTop(1);
			System.out.println("insert");
			advertService.insertAdvert(advert);
			if(filename!=null) {
				advert.getFile().transferTo(new File(localPath+filename));
			}
		}else{
			advert.setAdModifier(user.getLoginname());
			advert.setAdChangeTime(new Date());
			System.out.println("update");
			advertService.updateAdvert(advert);
			if(filename!=null) {
				advert.getFile().transferTo(new File(localPath+filename));
			};
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
	public void deleteAdvert(Integer[] list,PrintWriter out){
		System.out.println("deleteAdvert");
		System.out.println(list.length);
		advertService.deleteAdvert(list);
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
		advertService.updateAdvertSetTop(list);
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
		advertService.updateAdvertsetUntop(list);
		out.write("success");
		out.close();
	}
}
