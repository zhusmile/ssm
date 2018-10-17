package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Base;
import com.flf.mapper.BaseMapper;
import com.flf.service.BaseService;

public class BaseServiceImpl implements BaseService {
	private BaseMapper baseMapper;

	public BaseMapper getBaseMapper() {
		return baseMapper;
	}

	public void setBaseMapper(BaseMapper baseMapper) {
		this.baseMapper = baseMapper;
	}

	@Override
	public List<Base> getBaseListByArea(Integer bArea) {
		// TODO Auto-generated method stub
		return baseMapper.getBaseListByArea(bArea);
	}

	@Override
	public List<Base> getBaseList() {
		// TODO Auto-generated method stub
		return baseMapper.getBaseList();
	}

	@Override
	public List<Base> listPageBase(Base base) {
		// TODO Auto-generated method stub
		return baseMapper.listPageBase(base);
	}

	@Override
	public boolean insertBase(Base base) {
		// TODO Auto-generated method stub
		if(baseMapper.getCountOfName(base.getbName())==0) {
			baseMapper.insertBase(base);
			return true;
		}
		return false;
	}

	@Override
	public void deleteBaseById(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer bId : list) {
			baseMapper.deleteBaseById(bId);
		}
	}

	@Override
	public Base getBaseById(int bId) {
		// TODO Auto-generated method stub
		return baseMapper.getBaseById(bId);
	}

	@Override
	public boolean updateBase(Base base) {
		// TODO Auto-generated method stub
		if(base.getbName().equals(baseMapper.getBaseById(base.getbId()).getbName())) {
			baseMapper.updateBase(base);
			return true;
		}else if(baseMapper.getCountOfName(base.getbName())==0) {
			baseMapper.updateBase(base);
			return true;
		}
		return false;
	}

	@Override
	public void updateBaseSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer bId : list) {
			baseMapper.updateBaseSetTop(bId);
		}
	}

	@Override
	public void updateBaseSetunTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer bId : list) {
			baseMapper.updateBaseSetunTop(bId);
		}
	}

	@Override
	public List<Base> getBaseByBatchOrTypeOrAreaOrName(Base base) {
		// TODO Auto-generated method stub
		return baseMapper.getBaseByBatchOrTypeOrAreaOrName(base);
	}
	
}
