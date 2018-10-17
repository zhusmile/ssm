package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Industry;
import com.flf.mapper.IndustryMapper;
import com.flf.service.IndustryService;

public class IndustryServiceImpl implements IndustryService{
	private IndustryMapper industryMapper;
	public IndustryMapper getIndustryMapper() {
		return industryMapper;
	}

	public void setIndustryMapper(IndustryMapper industryMapper) {
		this.industryMapper = industryMapper;
	}

	@Override
	public List<Industry> listPageIndustry(Industry industry) {
		// TODO Auto-generated method stub
		return industryMapper.listPageIndustry(industry);
	}

	@Override
	public boolean insertIndustry(Industry industry) {
		// TODO Auto-generated method stub
		if(industryMapper.getCountByName(industry.getiName())==0) {
			industryMapper.insertIndustry(industry);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateIndustry(Industry industry) {
		// TODO Auto-generated method stub
		if(industryMapper.getIndustryById(industry.getiId()).getiName().equals(industry.getiName())) {
			return true;
		}else if(industryMapper.getCountByName(industry.getiName())==0){
			industryMapper.updateIndustry(industry);
			return true;
		}
		
		return false;
	}

	@Override
	public void deleteIndustry(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer iId : list) {
			industryMapper.deleteIndustry(iId);
		}
	}

	@Override
	public Industry getIndustryById(int iId) {
		// TODO Auto-generated method stub
		return industryMapper.getIndustryById(iId);
	}

	@Override
	public List<Industry> getIndustryList() {
		// TODO Auto-generated method stub
		return industryMapper.getIndustryList();
	}
	
}
