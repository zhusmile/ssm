package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Media;
import com.flf.mapper.MediaMapper;
import com.flf.service.MediaService;

public class MediaServiceImpl implements MediaService{
	private MediaMapper mediaMapper;

	public MediaMapper getMediaMapper() {
		return mediaMapper;
	}

	public void setMediaMapper(MediaMapper mediaMapper) {
		this.mediaMapper = mediaMapper;
	}

	@Override
	public List<Media> listPageMedia(Media media) {
		// TODO Auto-generated method stub
		return mediaMapper.listPageMedia(media);
	}

	@Override
	public boolean insertMedia(Media media) {
		// TODO Auto-generated method stub
		if(mediaMapper.getCountOfMediaByName(media.getmName())==0) {
			mediaMapper.insertMedia(media);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateMedia(Media media) {
		// TODO Auto-generated method stub
		if(mediaMapper.getMediaById(media.getmId()).getmName().equals(media.getmName())) {
			mediaMapper.updateMedia(media);
			return true;
		}else if(mediaMapper.getCountOfMediaByName(media.getmName())==0) {
			mediaMapper.updateMedia(media);
		}
		return false;
	}

	@Override
	public void deleteMedia(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list) {
			mediaMapper.deleteMedia(mId);
		}
		
	}

	@Override
	public void updateMediaSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list) {
			mediaMapper.updateMediaSetTop(mId);
		}
	}

	@Override
	public void updateMediaSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list) {
			mediaMapper.updateMediaSetUnTop(mId);
		}
	}

	@Override
	public Media getMediaById(int mId) {
		// TODO Auto-generated method stub
		return mediaMapper.getMediaById(mId);
	}
	
}
