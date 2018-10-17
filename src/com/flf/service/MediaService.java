package com.flf.service;

import java.util.List;

import com.flf.entity.Media;

public interface MediaService {
	//获取数据列表
	List<Media> listPageMedia(Media media);
	//添加数据
	boolean insertMedia(Media media);
	//修改数据
	boolean updateMedia(Media media);
	//删除数据
	void deleteMedia(Integer[] list);
	//置顶
	void updateMediaSetTop(Integer[] list);
	//取消置顶
	void updateMediaSetUnTop(Integer[] list);
	//根据id获取数据
	Media getMediaById(int mId);
}
