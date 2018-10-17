package com.flf.mapper;

import java.util.List;

import com.flf.entity.IndustryNews;

public interface IndustryNewsMapper {
	//获取数据
	List<IndustryNews> listPageIndustryNews(IndustryNews in);
	//添加数据
	void insertIndustryNews(IndustryNews in);
	//修改数据
	void updateIndustryNews(IndustryNews in);
	//删除数据
	void deleteIndustryNews(int inId);
	//根据id查找数据
	IndustryNews getIndustryNewsById(int inId);
	//置顶
	void updateIndustryNewsSetTop(int inId);
	//取消置顶
	void updateIndustryNewsSetUnTop(int inId);
	//发布
	void updateIndustryNewsPublish(int inId);
	//取消发布
	void updateIndustryNewsUnPublish(int inId);
	//查找同标题数据
	int getCountByinTitle(String inTitle);
}
