package com.flf.service;

import java.util.List;

import com.flf.entity.IndustryNews;

public interface IndustryNewsService {
	//获取数据
	List<IndustryNews> listPageIndustryNews(IndustryNews in);
	//添加数据
	boolean insertIndustryNews(IndustryNews in);
	//修改数据
	boolean updateIndustryNews(IndustryNews in);
	//删除数据
	void deleteIndustryNews(Integer[] list);
	//根据id查找数据
	IndustryNews getIndustryNewsById(int inId);
	//置顶
	void updateIndustryNewsSetTop(Integer[] list);
	//取消置顶
	void updateIndustryNewsSetUnTop(Integer[] list);
	//发布
	void updateIndustryNewsPublish(Integer[] list);
	//取消发布
	void updateIndustryNewsUnPublish(Integer[] list);
}
