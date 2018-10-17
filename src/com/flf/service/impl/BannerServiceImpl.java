package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Banner;
import com.flf.mapper.BannerMapper;
import com.flf.service.BannerService;

public class BannerServiceImpl implements BannerService{
	private BannerMapper bannerMapper;

	public BannerMapper getBannerMapper() {
		return bannerMapper;
	}

	public void setBannerMapper(BannerMapper bannerMapper) {
		this.bannerMapper = bannerMapper;
	}

	@Override
	public List<Banner> listPageBanner(Banner banner) {
		// TODO Auto-generated method stub
		return bannerMapper.listPageBanner(banner);
	}

	@Override
	public void insertBanner(Banner banner) {
		// TODO Auto-generated method stub
		bannerMapper.insertBanner(banner);
	}

	@Override
	public void updateBanner(Banner banner) {
		// TODO Auto-generated method stub
		bannerMapper.updateBanner(banner);
		
	}

	@Override
	public List<String> getBannerTypeList() {
		// TODO Auto-generated method stub
		return bannerMapper.getBannerTypeList();
	}

	@Override
	public void deleteBanner(int bannerId) {
		// TODO Auto-generated method stub
		bannerMapper.deleteBanner(bannerId);
	}

	@Override
	public void updateBannerSetTop(int bannerId) {
		// TODO Auto-generated method stub
		bannerMapper.updateBannerSetTop(bannerId);
		
	}

	@Override
	public void updateBannerSetunTop(int bannerId) {
		// TODO Auto-generated method stub
		bannerMapper.updateBannerSetunTop(bannerId);
	}

	@Override
	public Banner getBannerByid(int bannerId) {
		// TODO Auto-generated method stub
		return bannerMapper.getBannerById(bannerId);
	}
	
}
