package com.flf.service;

import java.util.List;

import com.flf.entity.Banner;

public interface BannerService {
	//获取数据
	List<Banner> listPageBanner(Banner banner);
	//通过id获取数据
	Banner getBannerByid(int bannerId);
	//添加数据
	void insertBanner(Banner banner);
	//更新数据
	void updateBanner(Banner banner);
	//获取类型列表
	List<String> getBannerTypeList();
	//删除数据
	void deleteBanner(int bannerId);
	//设置置顶
	void updateBannerSetTop(int bannerId);
	//解除置顶
	void updateBannerSetunTop(int bannerId);
	
}
