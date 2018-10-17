package com.flf.service;

import java.util.List;

import com.flf.entity.Fadvert;

public interface FadvertService {
	//获取数据列表
	List<Fadvert> listPageFadvert(Fadvert fadvert);
	//添加数据
	void insertFadvert(Fadvert fadvert);
	//修改数据
	void updateFadvert(Fadvert fadvert);
	//删除数据
	void deleteFadvert(Integer[] list);
	//修改置顶
	void updateFadvertSetTop(Integer[] list);
	//取消置顶
	void updateFadvertsetUntop(Integer[] list);
	//根据id获取数据
	Fadvert getFadvertById(int fId);
}
