package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Media;
import com.flf.entity.SavePath;
import com.flf.service.MediaService;

@Controller
@RequestMapping(value="/media")
public class MediaController {
	@Autowired
	private MediaService mediaService;
	/**
	 * 获取数据列表
	 * @param media
	 * @return
	 */
	@RequestMapping
	public ModelAndView getPage(Media media) {
		ModelAndView mv = new ModelAndView();
		List<Media> mList=mediaService.listPageMedia(media);
		mv.setViewName("/mediaAdmin/medias");
		mv.addObject("mList",mList);
		mv.addObject("media", media);
		return mv;
	}
	/**
	 * 前往新增
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAddMedia() {
		return "/mediaAdmin/media_info";
	}
	/**
	 * 前往修改
	 * @param adId
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEditMedia(@RequestParam Integer mId){
		System.out.println(mId);
		ModelAndView mView = new ModelAndView();
		Media media=mediaService.getMediaById(mId);
		mView.setViewName("/mediaAdmin/media_info");
		mView.addObject("media",media);
		return mView;
	}
	/**
	 * 保存增加或者修改的数据
	 * @param media
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveMedia(Media media,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		System.out.println(media.getmId());
		ModelAndView mv = new ModelAndView();
		String filename=null;
		String sqlPath=null;
		String localPath=null;
		SavePath savePath=new SavePath();
		if(!file.isEmpty()) {
			filename=savePath.getFileName(file);
			sqlPath=savePath.getSqlPath();
			localPath=savePath.getLocalPath();
			media.setmImg(sqlPath+filename);
		}
		if(media.getmId()==null ||media.getmId().intValue()==0) {
			System.out.println("insert");
			//默认未置顶
			media.setmSetTop(1);
			if(mediaService.insertMedia(media)) {
				mv.addObject("msg","success");
				if(filename!=null) {
					file.transferTo(new File(localPath+filename));
				}
			}else {
				mv.addObject("msg","failed");
			}
		}else{
			System.out.println("update");
			if(mediaService.updateMedia(media)) {
				mv.addObject("msg","success");
				if(filename!=null) {
					file.transferTo(new File(localPath+filename));
				}
			}else {
				mv.addObject("msg","failed");
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
	public void deleteMedia(Integer[] list,PrintWriter out){
		System.out.println("deleteMedia");
		System.out.println(list.length);
		mediaService.deleteMedia(list);
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
		mediaService.updateMediaSetTop(list);
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
		mediaService.updateMediaSetUnTop(list);
		out.write("success");
		out.close();
	}
}
