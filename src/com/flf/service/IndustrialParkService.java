package com.flf.service;

import java.util.List;

import com.flf.entity.IndustrialPark;

public interface IndustrialParkService {
	//获取数据列表
	List<IndustrialPark> listPageIndustrialPark(IndustrialPark ip);
	//添加数据
	boolean insertIndustrialPark(IndustrialPark ip);
	//修改数据
	boolean updateIndustrialPark(IndustrialPark ip);
	//删除数据
	void deleteIndustrialPark(Integer[] list);
	//置顶
	void updateIndustrialParkSetTop(Integer[] list);
	//取消置顶
	void updateIndustrialParkSetUnTop(Integer[] list);
	//根据id获取数据
	IndustrialPark getIndustrialParkById(int ipId);
}
