package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Fadvert;
import com.flf.mapper.FadvertMapper;
import com.flf.service.FadvertService;

public class FadvertServiceImpl implements FadvertService {
	private FadvertMapper fadvertMapper;

	public FadvertMapper getFadvertMapper() {
		return fadvertMapper;
	}

	public void setFadvertMapper(FadvertMapper fadvertMapper) {
		this.fadvertMapper = fadvertMapper;
	}

	@Override
	public List<Fadvert> listPageFadvert(Fadvert fadvert) {
		// TODO Auto-generated method stub
		return fadvertMapper.listPageFadvert(fadvert);
	}

	@Override
	public void insertFadvert(Fadvert fadvert) {
		// TODO Auto-generated method stub
		fadvertMapper.insertFadvert(fadvert);
	}

	@Override
	public void updateFadvert(Fadvert fadvert) {
		// TODO Auto-generated method stub
		fadvertMapper.updateFadvert(fadvert);
	}

	@Override
	public void deleteFadvert(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer fId : list) {
			fadvertMapper.deleteFadvert(fId);
		}
	}

	@Override
	public void updateFadvertSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer fId : list) {
			fadvertMapper.updateFadvertSetTop(fId);
		}
	}

	@Override
	public void updateFadvertsetUntop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer fId : list) {
			fadvertMapper.updateFadvertSetUnTop(fId);
		}
	}

	@Override
	public Fadvert getFadvertById(int fId) {
		// TODO Auto-generated method stub
		return fadvertMapper.getFadvertById(fId);
	}
	
}
