package com.flf.service.impl;

import java.util.List;

import com.flf.entity.EntreGroup;
import com.flf.mapper.EntreGroupMapper;
import com.flf.service.EntreGroupService;

public class EntreGroupServiceImpl implements EntreGroupService{
	private EntreGroupMapper entreGroupMapper;

	public EntreGroupMapper getEntreGroupMapper() {
		return entreGroupMapper;
	}

	public void setEntreGroupMapper(EntreGroupMapper entreGroupMapper) {
		this.entreGroupMapper = entreGroupMapper;
	}

	@Override
	public List<EntreGroup> listPageEntreGroup(EntreGroup entreGroup) {
		// TODO Auto-generated method stub
		return entreGroupMapper.listPageEntreGroup(entreGroup);
	}

	@Override
	public boolean insertEntreGroup(EntreGroup entreGroup) {
		// TODO Auto-generated method stub
		//确保不重名,重名不保存
		if(entreGroupMapper.getCountOfName(entreGroup.getEgName())==0) {
			entreGroupMapper.insertEntreGroup(entreGroup);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void deleteEntreGroupById(int egId) {
		// TODO Auto-generated method stub
		entreGroupMapper.deleteEntreGroupById(egId);
	}

	@Override
	public EntreGroup getEntreGroupById(int egId) {
		// TODO Auto-generated method stub
		return entreGroupMapper.getEntreGroupById(egId);
	}

	@Override
	public void updateEntreGroup(EntreGroup entreGroup) {
		// TODO Auto-generated method stub
		entreGroupMapper.updateEntreGroup(entreGroup);
	}

	@Override
	public void updateEntreGroupSetTop(int egId) {
		// TODO Auto-generated method stub
		entreGroupMapper.updateEntreGroupSetTop(egId);
	}

	@Override
	public void updateEntreGroupSetunTop(int egId) {
		// TODO Auto-generated method stub
		entreGroupMapper.updateEntreGroupSetunTop(egId);
	}

	@Override
	public List<EntreGroup> getEGList() {
		// TODO Auto-generated method stub
		return entreGroupMapper.getEGList();
	}
}
