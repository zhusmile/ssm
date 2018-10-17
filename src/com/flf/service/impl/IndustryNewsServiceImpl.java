package com.flf.service.impl;

import java.util.List;

import com.flf.entity.IndustryNews;
import com.flf.mapper.IndustryNewsMapper;
import com.flf.service.IndustryNewsService;

public class IndustryNewsServiceImpl implements IndustryNewsService{
	private IndustryNewsMapper industryNewsMapper;
	
	public IndustryNewsMapper getIndustryNewsMapper() {
		return industryNewsMapper;
	}

	public void setIndustryNewsMapper(IndustryNewsMapper industryNewsMapper) {
		this.industryNewsMapper = industryNewsMapper;
	}

	@Override
	public List<IndustryNews> listPageIndustryNews(IndustryNews in) {
		// TODO Auto-generated method stub
		return industryNewsMapper.listPageIndustryNews(in);
	}

	@Override
	public boolean insertIndustryNews(IndustryNews in) {
		// TODO Auto-generated method stub
		if(industryNewsMapper.getCountByinTitle(in.getInTitle())==0) {
			industryNewsMapper.insertIndustryNews(in);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateIndustryNews(IndustryNews in) {
		// TODO Auto-generated method stub
		if(industryNewsMapper.getIndustryNewsById(in.getInId()).getInTitle().equals(in.getInTitle())) {
			industryNewsMapper.updateIndustryNews(in);
			return true;
		}else if(industryNewsMapper.getCountByinTitle(in.getInTitle())==0) {
			industryNewsMapper.updateIndustryNews(in);
			return true;
		}
		return false;
	}

	@Override
	public void deleteIndustryNews(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer inId : list) {
			industryNewsMapper.deleteIndustryNews(inId);
		}
	}

	@Override
	public IndustryNews getIndustryNewsById(int inId) {
		// TODO Auto-generated method stub
		return industryNewsMapper.getIndustryNewsById(inId);
	}

	@Override
	public void updateIndustryNewsSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer inId : list) {
			industryNewsMapper.updateIndustryNewsSetTop(inId);
		}
	}

	@Override
	public void updateIndustryNewsSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer inId : list) {
			industryNewsMapper.updateIndustryNewsSetUnTop(inId);
		}
	}

	@Override
	public void updateIndustryNewsPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer inId : list) {
			industryNewsMapper.updateIndustryNewsPublish(inId);
		}
	}

	@Override
	public void updateIndustryNewsUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer inId : list) {
			industryNewsMapper.updateIndustryNewsUnPublish(inId);
		}
	}

}
