package com.flf.mapper;

import java.util.List;

import com.flf.entity.Area;
public interface AreaMapper {
	//根据名称获取数据
	Area getAreaByName(String aName);
	//获取区域列表,作为选择栏的选项
	List<Area> getAreaList();
	//获取or查找
	List<Area> listPageArea(Area area);
	//添加
	void insertArea(Area area);
	//修改
	void updateArea(Area area);
	//删除
	void deleteArea(int aId);
	//根据id获取
	Area getAreaById(int aId);
	//查找同名数据条数
	int getCountByName(String aName);
}
