package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Banner;
import com.flf.entity.User;
import com.flf.service.BannerService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/banner")
public class BannerController {
	@Autowired
	private BannerService bannerService;
	@RequestMapping
	/**
	 * banner数据显示
	 * @param banner
	 * @return
	 */
	public ModelAndView getPage(Banner banner){
		System.out.println("getpage()");
		System.out.println(banner.getBannerName());
		ModelAndView mView=new ModelAndView();
		List<Banner> bannerList=bannerService.listPageBanner(banner);
		List<String> bannerTypeList=bannerService.getBannerTypeList();
		mView.setViewName("banners");
		mView.addObject("bannerList",bannerList);
		mView.addObject("banner",banner);
		mView.addObject("bannerTypeList",bannerTypeList);
		return mView;
	}
	/**
	 * 删除数据
	 * @param list
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteBanner(Integer[] list,PrintWriter out){
		System.out.println("deleteBanner");
		System.out.println(list.length);
		for (Integer bannerId : list) {
			System.out.println(bannerId);
			bannerService.deleteBanner(bannerId);
		}
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/setTop")
	public void setTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		for (Integer bannerId : list) {
			System.out.println(bannerId);
			bannerService.updateBannerSetTop(bannerId);
		}
		out.write("success");
		out.close();
	}
	@RequestMapping(value="/unsetTop")
	public void unsetTop(Integer[] list,PrintWriter out){
		System.out.println("setTop");
		System.out.println(list.length);
		for (Integer bannerId : list) {
			System.out.println(bannerId);
			bannerService.updateBannerSetunTop(bannerId);
		}
		out.write("success");
		out.close();
	}
	/**
	 * 前端点击新增按钮前往信息页面 banner_info.jsp
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddBanner(Model model) {
		return "banner_info";
	}
	/**
	 * 前端点击修改按钮前往信息页面 banner_info.jsp
	 * @param bannerId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditBanner(@RequestParam Integer bannerId){
		System.out.println("toEditBanner");
		System.out.println(bannerId);
		ModelAndView mView = new ModelAndView();
		Banner banner=bannerService.getBannerByid(bannerId);
		mView.setViewName("banner_info");
		mView.addObject("banner",banner);
		return mView;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveBanner(Banner banner,HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mView = new ModelAndView();
		User user=(User) session.getAttribute(Const.SESSION_USER);
		String username=user.getLoginname();
	    //保存数据库的路径  
	    String sqlPath = null;   
	    //定义文件保存的本地路径  
	    String localPath="E:\\eclipse-workspace\\ssm\\WebRoot\\uploadFiles\\uploadImgs\\";
	    System.out.println(localPath);
	    //定义 文件名  
	    String filename=null;   
		if(!banner.getFile().isEmpty()) {
	          //生成uuid作为文件名称    
	          String uuid = UUID.randomUUID().toString().replaceAll("-","");    
	          //获得文件类型（可以判断如果不是图片，禁止上传）    
	          String contentType=banner.getFile().getContentType();    
	          //获得文件后缀名   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //得到 文件名  
	          filename=uuid+"."+suffixName;   
	          System.out.println(filename); 
	  	      //把图片的相对路径保存至数据库  
	  	      sqlPath = "/uploadImgs/"+filename;  
	  	      System.out.println(sqlPath);
	  	      
		}
  		//判断是新增还是修改
  		if(banner.getBannerId()==null||banner.getBannerId().intValue()==0) {
  			//新增 添加发布人和发布时间 设置为未置顶
  			System.out.println("insert");
  			banner.setIssuer(username);
  			banner.setBannerSet(2);
  			banner.setAddTime(new Date());
  			if(!banner.getFile().isEmpty()) {
  				banner.setBannerSrc(sqlPath);
  				banner.getFile().transferTo(new File(localPath+filename));
  			} 
  			bannerService.insertBanner(banner);
  		}else{
  			//修改 添加修改人和修改时间
  			System.out.println("edit");
  			Banner newBanner=bannerService.getBannerByid(banner.getBannerId());
  			newBanner.setModifier(username);
  			newBanner.setChangeTime(new Date());
  			newBanner.setBannerOrder(banner.getBannerOrder());
  			newBanner.setBannerLink(banner.getBannerLink());
  			newBanner.setBannerType(banner.getBannerType());
  			newBanner.setBannerName(banner.getBannerName());
  			if(!banner.getFile().isEmpty()) {
  				newBanner.setBannerSrc(sqlPath);
  				banner.getFile().transferTo(new File(localPath+filename));
  			} 
  			bannerService.updateBanner(newBanner);
  		}
		mView.setViewName("save_result");
		return mView;
	}
}
