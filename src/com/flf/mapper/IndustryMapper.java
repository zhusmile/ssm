package com.flf.mapper;

import java.util.List;

import com.flf.entity.Industry;

public interface IndustryMapper {
	//获取or查找
	List<Industry> listPageIndustry(Industry industry);
	//添加
	void insertIndustry(Industry industry);
	//修改
	void updateIndustry(Industry industry);
	//删除
	void deleteIndustry(int iId);
	//根据id获取
	Industry getIndustryById(int iId);
	//查找同名数据条数
	int getCountByName(String iName);
	List<Industry> getIndustryList();
}
