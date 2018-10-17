package com.flf.mapper;

import java.util.List;

import com.flf.entity.Base;

public interface BaseMapper {
	//根据区域获得该区域下的所有基地
	List<Base> getBaseListByArea(Integer bArea);
	List<Base> getBaseList();
	//获取信息
	List<Base> listPageBase(Base base);
	//添加信息
	void insertBase(Base base);
	//删除信息
	void deleteBaseById(int bId);
	//通过id 获取信息
	Base getBaseById(int bId);
	//更新信息
	void updateBase(Base base);
	//设置置顶
	void updateBaseSetTop(int bId);
	//取消置顶
	void updateBaseSetunTop(int bId);
	//查看name是否存在
	int getCountOfName(String bName);
	//
	List<Base> getBaseByBatchOrTypeOrAreaOrName(Base base);
	
}
