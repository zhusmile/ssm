package com.flf.service;

import java.util.List;

import com.flf.entity.Advert;

public interface AdvertService {
	//获取数据列表
	List<Advert> listPageAdvert(Advert advert);
	//添加数据
	void insertAdvert(Advert advert);
	//修改数据
	void updateAdvert(Advert advert);
	//删除数据
	void deleteAdvert(Integer[] list);
	//修改置顶
	void updateAdvertSetTop(Integer[] list);
	//取消置顶
	void updateAdvertsetUntop(Integer[] list);
	//根据id获取数据
	Advert getAdvertById(int adId);
}
