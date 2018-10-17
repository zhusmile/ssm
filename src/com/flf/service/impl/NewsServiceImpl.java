package com.flf.service.impl;

import java.util.List;

import com.flf.entity.News;
import com.flf.mapper.NewsMapper;
import com.flf.service.NewsService;

public class NewsServiceImpl implements NewsService {
	private NewsMapper newsMapper;
	
	public NewsMapper getNewsMapper() {
		return newsMapper;
	}

	public void setNewsMapper(NewsMapper newsMapper) {
		this.newsMapper = newsMapper;
	}

	@Override
	public List<News> listPageNews(News n) {
		// TODO Auto-generated method stub
		return newsMapper.listPageNews(n);
	}

	@Override
	public boolean insertNews(News n) {
		// TODO Auto-generated method stub
		if(newsMapper.getCountBynTitle(n)==0) {
			newsMapper.insertNews(n);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateNews(News n) {
		// TODO Auto-generated method stub
		if(newsMapper.getNewsById(n.getnId()).getnTitle().equals(n.getnTitle())) {
			newsMapper.updateNews(n);
			return true;
		}else if(newsMapper.getCountBynTitle(n)==0) {
			newsMapper.updateNews(n);
			return true;
		}
		return false;
	}

	@Override
	public void deleteNews(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer nId : list) {
			newsMapper.deleteNews(nId);
		}
	}

	@Override
	public News getNewsById(int nId) {
		// TODO Auto-generated method stub
		return newsMapper.getNewsById(nId);
	}

	@Override
	public void updateNewsSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer nId : list) {
			newsMapper.updateNewsSetTop(nId);
		}
	}

	@Override
	public void updateNewsSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer nId : list) {
			newsMapper.updateNewsSetUnTop(nId);
		}
	}

	@Override
	public void updateNewsPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer nId : list) {
			newsMapper.updateNewsPublish(nId);
		}
	}

	@Override
	public void updateNewsUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer nId : list) {
			newsMapper.updateNewsUnPublish(nId);
		}
	}

	@Override
	public List<News> getQCG() {
		// TODO Auto-generated method stub
		return newsMapper.getQCG();
	}

	@Override
	public List<News> getZXX() {
		// TODO Auto-generated method stub
		return newsMapper.getZXX();
	}

	@Override
	public void updatePageView(int nId) {
		// TODO Auto-generated method stub
		newsMapper.updatePageView(nId);
	}

}
