package com.flf.service;

import java.util.List;

import com.flf.entity.Industry;
public interface IndustryService {
	//获取or查找
	List<Industry> listPageIndustry(Industry industry);
	//添加
	boolean insertIndustry(Industry industry);
	//修改
	boolean updateIndustry(Industry industry);
	//删除
	void deleteIndustry(Integer[] list);
	//根据id获取
	Industry getIndustryById(int inId);
	List<Industry> getIndustryList();
}
