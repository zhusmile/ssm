package com.flf.service;

import java.util.List;

import com.flf.entity.Ecosphere;

public interface EcosphereService {
	//获取or查找
	List<Ecosphere> listPageEcosphere(Ecosphere ecosphere);
	//添加
	boolean insertEcosphere(Ecosphere ecosphere);
	//修改
	boolean updateEcosphere(Ecosphere ecosphere);
	//删除
	void deleteEcosphere(Integer[] list);
	//根据id获取
	Ecosphere getEcosphereById(int eId);
}
