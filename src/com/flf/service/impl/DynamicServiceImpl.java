package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Base;
import com.flf.entity.Dynamic;
import com.flf.mapper.DynamicMapper;
import com.flf.service.DynamicService;

public class DynamicServiceImpl implements DynamicService{
	private DynamicMapper dynamicMapper;

	public DynamicMapper getDynamicMapper() {
		return dynamicMapper;
	}

	public void setDynamicMapper(DynamicMapper dynamicMapper) {
		this.dynamicMapper = dynamicMapper;
	}

	@Override
	public List<Dynamic> listPageDynamic(Dynamic dy) {
		// TODO Auto-generated method stub
		return dynamicMapper.listPageDynamic(dy);
	}

	@Override
	public void insertDynamic(Dynamic dy) {
		// TODO Auto-generated method stub
		dynamicMapper.insertDynamic(dy);
	}

	@Override
	public void updateDynamic(Dynamic dy) {
		// TODO Auto-generated method stub
		dynamicMapper.updateDynamic(dy);
	}

	@Override
	public void deleteDynamic(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer dyId : list) {
			dynamicMapper.deleteDynamic(dyId);
		}
	}

	@Override
	public Dynamic getDynamicById(Integer dyId) {
		// TODO Auto-generated method stub
		return dynamicMapper.getDynamicById(dyId);
	}

	@Override
	public void updateDynamicSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer dyId : list) {
			dynamicMapper.updateDynamicSetTop(dyId);
		}
	}

	@Override
	public void updateDynamicSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer dyId : list) {
			dynamicMapper.updateDynamicSetUnTop(dyId);
		}
	}

	@Override
	public void updateDynamicPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer dyId : list) {
			dynamicMapper.updateDynamicPublish(dyId);
		}
	}

	@Override
	public void updateDynamicUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer dyId : list) {
			dynamicMapper.updateDynamicUnPublish(dyId);
		}
	}

	@Override
	public int getDynamicCount() {
		// TODO Auto-generated method stub
		return dynamicMapper.getDynamicCount();
	}


	@Override
	public List<Dynamic> getBuWeiDyList() {
		// TODO Auto-generated method stub
		return dynamicMapper.getBuWeiDyList();
	}

	@Override
	public List<Dynamic> getDiFangDyList() {
		// TODO Auto-generated method stub
		return dynamicMapper.getDiFangDyList();
	}

	@Override
	public List<Dynamic> getSHTTDyList() {
		// TODO Auto-generated method stub
		return dynamicMapper.getSHTTDyList();
	}

	@Override
	public List<Dynamic> getJidiDyList() {
		// TODO Auto-generated method stub
		return dynamicMapper.getJidiDyList();
	}

	@Override
	public List<Dynamic> getAllDyList() {
		// TODO Auto-generated method stub
		return dynamicMapper.getAllDyList();
	}

	@Override
	public List<Dynamic> getDyList(Dynamic dy) {
		// TODO Auto-generated method stub
		return dynamicMapper.getDyList(dy);
	}

	@Override
	public List<Dynamic> getDylistToBaseExpPage(Base base) {
		// TODO Auto-generated method stub
		return dynamicMapper.getDylistToBaseExpPage(base);
	}

	@Override
	public List<Dynamic> getDylistByBase(int id) {
		// TODO Auto-generated method stub
		return dynamicMapper.getDylistByBase(id);
	}

	@Override
	public void updatePageView(int id, int count) {
		// TODO Auto-generated method stub
		dynamicMapper.updatePageView(id, count);
	}
	
}
