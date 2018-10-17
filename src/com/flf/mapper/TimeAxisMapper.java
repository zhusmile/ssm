package com.flf.mapper;

import java.util.List;

import com.flf.entity.TimeAxis;

public interface TimeAxisMapper {
	//获取or查找
	List<TimeAxis> listPageTimeAxis(TimeAxis timeAxis);
	//添加
	void insertTimeAxis(TimeAxis timeAxis);
	//修改
	void updateTimeAxis(TimeAxis timeAxis);
	//删除
	void deleteTimeAxis(int tId);
	//根据id获取
	TimeAxis getTimeAxisById(int tId);
	//查找同名数据条数
	int getCountByName(String tName);
}
