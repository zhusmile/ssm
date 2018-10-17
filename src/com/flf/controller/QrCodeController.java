package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.QrCode;
import com.flf.service.QrCodeService;

@Controller
public class QrCodeController {
	@Autowired
	private QrCodeService qrCodeService;
	@RequestMapping(value="/qrCode")
	public ModelAndView get() {
		ModelAndView mv=new ModelAndView();
		List<QrCode> list=qrCodeService.listAllQrcode();
		System.out.println(list.size());
		mv.setViewName("qrCode");
		mv.addObject("qrCodeList",list);
		return mv;
	}
	@RequestMapping(value="/toUpdate")
	public ModelAndView update(QrCode qCode) throws IllegalStateException, IOException {
//		System.out.println("111111");
//		System.out.println(qCode.getCodeId());
		ModelAndView mv = new ModelAndView();
	      //保存数据库的路径  
	      String sqlPath = null;   
	      //定义文件保存的本地路径 
	      String localPath="E:\\eclipse-workspace\\ssm\\WebRoot\\uploadFiles\\uploadImgs\\";
	      System.out.println(localPath);
	      //定义 文件名  
	      String filename=null;    
	      if(!qCode.getFile().isEmpty()){    
	          //生成uuid作为文件名称    
	          String uuid = UUID.randomUUID().toString().replaceAll("-","");    
	          //获得文件类型（可以判断如果不是图片，禁止上传）    
	          String contentType=qCode.getFile().getContentType();    
	          //获得文件后缀名   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //得到 文件名  
	          filename=uuid+"."+suffixName;   
	          System.out.println(filename); 
	  	      //把图片的相对路径保存至数据库  
	  	      sqlPath = "/uploadImgs/"+filename;  
	  	      System.out.println(sqlPath);
	  	      qCode.setCodeSrc(sqlPath);
	  	      qCode.getFile().transferTo(new File(localPath+filename));
	  	      qrCodeService.updateQrCode(qCode);
	      }
			List<QrCode> list=qrCodeService.listAllQrcode();
			System.out.println(list.size());
			mv.setViewName("qrCode");
			mv.addObject("qrCodeList",list);
		return mv;
	}
	
}
