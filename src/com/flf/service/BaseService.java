package com.flf.service;

import java.util.List;

import com.flf.entity.Base;

public interface BaseService {
	//根据区域获得该区域下的所有基地
	List<Base> getBaseListByArea(Integer bArea);
	//直接获取所有基地
	List<Base> getBaseList();
	//获取信息
	List<Base> listPageBase(Base base);
	//添加信息
	boolean insertBase(Base base);
	//删除信息
	void deleteBaseById(Integer[] list);
	//通过id 获取信息
	Base getBaseById(int bId);
	//更新信息
	boolean updateBase(Base base);
	//设置置顶
	void updateBaseSetTop(Integer[] list);
	//取消置顶
	void updateBaseSetunTop(Integer[] list);
	//
	List<Base> getBaseByBatchOrTypeOrAreaOrName(Base base);
}
