package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Advert;
import com.flf.mapper.AdvertMapper;
import com.flf.service.AdvertService;

public class AdvertServiceImpl implements AdvertService{
	private AdvertMapper advertMapper;

	

	public AdvertMapper getAdvertMapper() {
		return advertMapper;
	}

	public void setAdvertMapper(AdvertMapper advertMapper) {
		this.advertMapper = advertMapper;
	}

	@Override
	public List<Advert> listPageAdvert(Advert advert) {
		// TODO Auto-generated method stub
		return advertMapper.listPageAdvert(advert);
	}

	@Override
	public void insertAdvert(Advert advert) {
		// TODO Auto-generated method stub
		advertMapper.insertAdvert(advert);
	}

	@Override
	public void updateAdvert(Advert advert) {
		// TODO Auto-generated method stub
		advertMapper.updateAdvert(advert);
		
	}

	@Override
	public void deleteAdvert(Integer[] list) {
		// TODO Auto-generated method stub
		for(Integer adId:list) {
			advertMapper.deleteAdvert(adId);
		}
	}

	@Override
	public void updateAdvertSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for(Integer adId:list) {
			advertMapper.updateAdvertSetTop(adId);
		}
	}

	@Override
	public void updateAdvertsetUntop(Integer[] list) {
		// TODO Auto-generated method stub
		for(Integer adId:list) {
			advertMapper.updateAdvertSetUnTop(adId);
		}
	}

	@Override
	public Advert getAdvertById(int adId) {
		// TODO Auto-generated method stub
		return advertMapper.getAdvertById(adId);
	}
	
}
