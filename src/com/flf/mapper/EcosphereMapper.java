package com.flf.mapper;

import java.util.List;

import com.flf.entity.Ecosphere;

public interface EcosphereMapper {
	
	//获取or查找
	List<Ecosphere> listPageEcosphere(Ecosphere ecosphere);
	//添加
	void insertEcosphere(Ecosphere ecosphere);
	//修改
	void updateEcosphere(Ecosphere ecosphere);
	//删除
	void deleteEcosphere(int eId);
	//根据id获取
	Ecosphere getEcosphereById(int eId);
	//查找同名数据条数
	int getCountByName(String eName);
}
