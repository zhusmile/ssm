package com.flf.mapper;

import java.util.List;

import com.flf.entity.IndustrialPark;

public interface IndustrialParkMapper {
	//获取数据列表
	List<IndustrialPark> listPageIndustrialPark(IndustrialPark ip);
	//添加数据
	void insertIndustrialPark(IndustrialPark ip);
	//修改数据
	void updateIndustrialPark(IndustrialPark ip);
	//删除数据
	void deleteIndustrialPark(int ipId);
	//置顶
	void updateIndustrialParkSetTop(int ipId);
	//取消置顶
	void updateIndustrialParkSetUnTop(int ipId);
	//根据id获取数据
	IndustrialPark getIndustrialParkById(int ipId);
	//统计同名数据条数
	int getCountByName(String ipName);
}
