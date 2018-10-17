package com.flf.service;

import java.util.List;

import com.flf.entity.GeneralAdvert;

public interface GeneralAdvertService {
	//获取数据列表
	List<GeneralAdvert> listPageGeneralAdvert(GeneralAdvert ga);
	//添加数据
	void insertGeneralAdvert(GeneralAdvert ga);
	//修改数据
	void updateGeneralAdvert(GeneralAdvert ga);
	//删除数据
	void deleteGeneralAdvert(Integer[] list);
	//置顶
	void updateGeneralAdvertSetTop(Integer[] list);
	//取消置顶
	void updateGeneralAdvertSetUnTop(Integer[] list);
	//根据id获取数据
	GeneralAdvert getGeneralAdvertById(int gaId);
}
