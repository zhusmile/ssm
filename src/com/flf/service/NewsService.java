package com.flf.service;

import java.util.List;

import com.flf.entity.News;

public interface NewsService {
	//获取数据
	List<News> listPageNews(News n);
	//添加数据
	boolean insertNews(News n);
	//修改数据
	boolean updateNews(News n);
	//删除数据
	void deleteNews(Integer[] list);
	//根据id查找数据
	News getNewsById(int nId);
	//置顶
	void updateNewsSetTop(Integer[] list);
	//取消置顶
	void updateNewsSetUnTop(Integer[] list);
	//发布
	void updateNewsPublish(Integer[] list);
	//取消发布
	void updateNewsUnPublish(Integer[] list);
	//获取全面创新改革实验(type<5)
	List<News> getQCG();
	//获取战略性新兴产业
	List<News> getZXX();
	//更新访问量
	void updatePageView(int nId);
}
