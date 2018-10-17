package com.flf.service;

import java.util.List;

import com.flf.entity.Area;

public interface AreaService {
	//根据名称获取数据
	Area getAreaByName(String aName);
	//获取区域列表,作为选择栏的选项
	List<Area> getAreaList();
	//获取or查找
	List<Area> listPageArea(Area area);
	//添加
	boolean insertArea(Area area);
	//修改
	boolean updateArea(Area area);
	//删除
	void deleteArea(Integer[] list);
	//根据id获取
	Area getAreaById(int aId);
}
