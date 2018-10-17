package com.flf.mapper;

import java.util.List;

import com.flf.entity.Advert;

public interface AdvertMapper {
	//获取数据列表
	List<Advert> listPageAdvert(Advert advert);
	//添加数据
	void insertAdvert(Advert advert);
	//修改数据
	void updateAdvert(Advert advert);
	//删除数据
	void deleteAdvert(int adId);
	//置顶
	void updateAdvertSetTop(int adId);
	//取消置顶
	void updateAdvertSetUnTop(int adId);
	//根据id获取数据
	Advert getAdvertById(int adId);
}
