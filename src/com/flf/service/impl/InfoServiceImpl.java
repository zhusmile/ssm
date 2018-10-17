package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Information;
import com.flf.mapper.InfoMapper;
import com.flf.service.InfoService;

public class InfoServiceImpl implements InfoService {
	private InfoMapper infoMapper;

	public InfoMapper getInfoMapper() {
		return infoMapper;
	}

	public void setInfoMapper(InfoMapper infoMapper) {
		this.infoMapper = infoMapper;
	}

	@Override
	public List<Information> listPageInformation(Information info) {
		// TODO Auto-generated method stub
		return infoMapper.listPageInformation(info);
	}

	@Override
	public void insertInformation(Information info) {
		// TODO Auto-generated method stub
		infoMapper.insertInformation(info);
	}

	@Override
	public void updateInformation(Information info) {
		// TODO Auto-generated method stub
		infoMapper.updateInformation(info);
	}

	@Override
	public void deleteInformation(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer infoId : list) {
			infoMapper.deleteInformation(infoId);
		}
	}

	@Override
	public void updateInformationSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer infoId : list) {
			infoMapper.updateInformationSetTop(infoId);
		}
	}

	@Override
	public void updateInformationSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer infoId : list) {
			infoMapper.updateInformationSetUnTop(infoId);;
		}
	}

	@Override
	public Information getInformationById(int infoId) {
		// TODO Auto-generated method stub
		return infoMapper.getInformationById(infoId);
	}
	
}
