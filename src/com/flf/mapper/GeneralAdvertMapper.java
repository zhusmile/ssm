package com.flf.mapper;

import java.util.List;

import com.flf.entity.GeneralAdvert;

public interface GeneralAdvertMapper {
	//获取数据列表
	List<GeneralAdvert> listPageGeneralAdvert(GeneralAdvert ga);
	//添加数据
	void insertGeneralAdvert(GeneralAdvert ga);
	//修改数据
	void updateGeneralAdvert(GeneralAdvert ga);
	//删除数据
	void deleteGeneralAdvert(int gaId);
	//置顶
	void updateGeneralAdvertSetTop(int gaId);
	//取消置顶
	void updateGeneralAdvertSetUnTop(int gaId);
	//根据id获取数据
	GeneralAdvert getGeneralAdvertById(int gaId);
}
