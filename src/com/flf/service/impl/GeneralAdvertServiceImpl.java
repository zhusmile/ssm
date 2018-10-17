package com.flf.service.impl;

import java.util.List;

import com.flf.entity.GeneralAdvert;
import com.flf.mapper.GeneralAdvertMapper;
import com.flf.service.GeneralAdvertService;

public class GeneralAdvertServiceImpl implements GeneralAdvertService {
	private GeneralAdvertMapper generalAdvertMapper;

	public GeneralAdvertMapper getGeneralAdvertMapper() {
		return generalAdvertMapper;
	}

	public void setGeneralAdvertMapper(GeneralAdvertMapper generalAdvertMapper) {
		this.generalAdvertMapper = generalAdvertMapper;
	}

	@Override
	public List<GeneralAdvert> listPageGeneralAdvert(GeneralAdvert ga) {
		// TODO Auto-generated method stub
		return generalAdvertMapper.listPageGeneralAdvert(ga);
	}

	@Override
	public void insertGeneralAdvert(GeneralAdvert ga) {
		// TODO Auto-generated method stub
		generalAdvertMapper.insertGeneralAdvert(ga);
	}

	@Override
	public void updateGeneralAdvert(GeneralAdvert ga) {
		// TODO Auto-generated method stub
		generalAdvertMapper.updateGeneralAdvert(ga);
	}

	@Override
	public void deleteGeneralAdvert(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer gaId : list) {
			generalAdvertMapper.deleteGeneralAdvert(gaId);
		}
		
	}

	@Override
	public void updateGeneralAdvertSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer gaId : list) {
			generalAdvertMapper.updateGeneralAdvertSetTop(gaId);
		}
		
	}

	@Override
	public void updateGeneralAdvertSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer gaId : list) {
			generalAdvertMapper.updateGeneralAdvertSetUnTop(gaId);
		}
	}

	@Override
	public GeneralAdvert getGeneralAdvertById(int gaId) {
		// TODO Auto-generated method stub
		return generalAdvertMapper.getGeneralAdvertById(gaId);
	}
	
}
