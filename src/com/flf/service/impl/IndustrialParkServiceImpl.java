package com.flf.service.impl;

import java.util.List;

import com.flf.entity.IndustrialPark;
import com.flf.mapper.IndustrialParkMapper;
import com.flf.service.IndustrialParkService;

public class IndustrialParkServiceImpl implements IndustrialParkService{
	private IndustrialParkMapper industrialParkMapper;
	
	public IndustrialParkMapper getIndustrialParkMapper() {
		return industrialParkMapper;
	}

	public void setIndustrialParkMapper(IndustrialParkMapper industrialParkMapper) {
		this.industrialParkMapper = industrialParkMapper;
	}

	@Override
	public List<IndustrialPark> listPageIndustrialPark(IndustrialPark ip) {
		// TODO Auto-generated method stub
		return industrialParkMapper.listPageIndustrialPark(ip);
	}

	@Override
	public boolean insertIndustrialPark(IndustrialPark ip) {
		// TODO Auto-generated method stub
		if(industrialParkMapper.getCountByName(ip.getIpName())==0) {
			industrialParkMapper.insertIndustrialPark(ip);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateIndustrialPark(IndustrialPark ip) {
		// TODO Auto-generated method stub
		if(industrialParkMapper.getIndustrialParkById(ip.getIpId()).getIpName().equals(ip.getIpName())) {
			industrialParkMapper.updateIndustrialPark(ip);
			return true;
		}else if(industrialParkMapper.getCountByName(ip.getIpName())==0) {
			industrialParkMapper.updateIndustrialPark(ip);
			return true;
		}
		return false;
	}

	@Override
	public void deleteIndustrialPark(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer ipId : list) {
			industrialParkMapper.deleteIndustrialPark(ipId);
		}
	}

	@Override
	public void updateIndustrialParkSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer ipId : list) {
			industrialParkMapper.updateIndustrialParkSetTop(ipId);
		}
	}

	@Override
	public void updateIndustrialParkSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer ipId : list) {
			industrialParkMapper.updateIndustrialParkSetUnTop(ipId);
		}
	}

	@Override
	public IndustrialPark getIndustrialParkById(int ipId) {
		// TODO Auto-generated method stub
		return industrialParkMapper.getIndustrialParkById(ipId);
	}

}
