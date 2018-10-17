package com.flf.mapper;

import java.util.List;

import com.flf.entity.Media;

public interface MediaMapper {
	//获取数据列表
	List<Media> listPageMedia(Media media);
	//添加数据
	void insertMedia(Media media);
	//修改数据
	void updateMedia(Media media);
	//删除数据
	void deleteMedia(int mId);
	//置顶
	void updateMediaSetTop(int mId);
	//取消置顶
	void updateMediaSetUnTop(int mId);
	//根据id获取数据
	Media getMediaById(int mId);
	//获取相同名称的数据个数(为后面保证添加修改不会发生重名准备)
	int getCountOfMediaByName(String mName);
}
