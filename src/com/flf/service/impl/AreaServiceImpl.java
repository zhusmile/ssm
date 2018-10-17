package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Area;
import com.flf.mapper.AreaMapper;
import com.flf.service.AreaService;

public class AreaServiceImpl implements AreaService {
	private AreaMapper areaMapper;
	
	public AreaMapper getAreaMapper() {
		return areaMapper;
	}

	public void setAreaMapper(AreaMapper areaMapper) {
		this.areaMapper = areaMapper;
	}

	@Override
	public Area getAreaByName(String aName) {
		// TODO Auto-generated method stub
		return areaMapper.getAreaByName(aName);
	}

	@Override
	public List<Area> getAreaList() {
		// TODO Auto-generated method stub
		return areaMapper.getAreaList();
	}

	@Override
	public List<Area> listPageArea(Area area) {
		// TODO Auto-generated method stub
		return areaMapper.listPageArea(area);
	}

	@Override
	public boolean insertArea(Area area) {
		// TODO Auto-generated method stub
		if(areaMapper.getCountByName(area.getaName())==0) {
			areaMapper.insertArea(area);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateArea(Area area) {
		// TODO Auto-generated method stub
		if(area.getaName().equals(areaMapper.getAreaById(area.getaId()).getaName())) {
			areaMapper.updateArea(area);
			return true;
		}else if(areaMapper.getCountByName(area.getaName())==0) {
			areaMapper.updateArea(area);
			return true;
		}
		return false;
	}

	@Override
	public void deleteArea(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			areaMapper.deleteArea(aId);
		}
	}

	@Override
	public Area getAreaById(int aId) {
		// TODO Auto-generated method stub
		return areaMapper.getAreaById(aId);
	}

}
