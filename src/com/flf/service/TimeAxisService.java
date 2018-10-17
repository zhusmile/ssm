package com.flf.service;

import java.util.List;

import com.flf.entity.TimeAxis;

public interface TimeAxisService {
	//获取or查找
	List<TimeAxis> listPageTimeAxis(TimeAxis timexis);
	//添加
	boolean insertTimeAxis(TimeAxis timeAxis);
	//修改
	boolean updateTimeAxis(TimeAxis timeAxis);
	//删除
	void deleteTimeAxis(Integer[] list);
	//根据id获取
	TimeAxis getTimeAxisById(int tId);
}
