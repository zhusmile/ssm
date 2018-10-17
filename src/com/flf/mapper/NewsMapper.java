package com.flf.mapper;

import java.util.List;

import com.flf.entity.News;

public interface NewsMapper {
	//获取数据
	List<News> listPageNews(News n);
	//添加数据
	void insertNews(News n);
	//修改数据
	void updateNews(News n);
	//删除数据
	void deleteNews(int nId);
	//根据id查找数据
	News getNewsById(int nId);
	//置顶
	void updateNewsSetTop(int nId);
	//取消置顶
	void updateNewsSetUnTop(int nId);
	//发布
	void updateNewsPublish(int nId);
	//取消发布
	void updateNewsUnPublish(int aId);
	//查找同标题数据
	int getCountBynTitle(News n);
	//获取全面创新改革实验(type<5)
	List<News> getQCG();
	//获取战略性新兴产业
	List<News> getZXX();
	//更新访问量
	void updatePageView(int nId);
}
