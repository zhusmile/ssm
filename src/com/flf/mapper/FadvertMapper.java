package com.flf.mapper;

import java.util.List;

import com.flf.entity.Fadvert;


public interface FadvertMapper {
	//获取数据列表
	List<Fadvert> listPageFadvert(Fadvert fadvert);
	//添加数据
	void insertFadvert(Fadvert fadvert);
	//修改数据
	void updateFadvert(Fadvert fadvert);
	//删除数据
	void deleteFadvert(int fId);
	//置顶
	void updateFadvertSetTop(int fId);
	//取消置顶
	void updateFadvertSetUnTop(int fId);
	//根据id获取数据
	Fadvert getFadvertById(int fId);
}
