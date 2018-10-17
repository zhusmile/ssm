package com.flf.service.impl;

import java.util.List;

import com.flf.entity.ExhibitionRoom;
import com.flf.mapper.ExhibitionRoomMapper;
import com.flf.service.ExhibitionRoomService;

public class ExhibitionRoomServiceImpl implements ExhibitionRoomService{
	private ExhibitionRoomMapper exhibitionRoomMapper;


	public ExhibitionRoomMapper getExhibitionRoomMapper() {
		return exhibitionRoomMapper;
	}

	public void setExhibitionRoomMapper(ExhibitionRoomMapper exhibitionRoomMapper) {
		this.exhibitionRoomMapper = exhibitionRoomMapper;
	}

	@Override
	public List<ExhibitionRoom> listPageExhibitionRoom(ExhibitionRoom m) {
		// TODO Auto-generated method stub
		return exhibitionRoomMapper.listPageExhibitionRoom(m);
	}

	@Override
	public boolean insertExhibitionRoom(ExhibitionRoom m) {
		// TODO Auto-generated method stub
		if(exhibitionRoomMapper.getCountByMtitle(m.getErTitle())==0) {
			exhibitionRoomMapper.insertExhibitionRoom(m);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateExhibitionRoom(ExhibitionRoom m) {
		// TODO Auto-generated method stub
		if(exhibitionRoomMapper.getExhibitionRoomById(m.getErId()).getErTitle().equals(m.getErTitle())) {
			exhibitionRoomMapper.updateExhibitionRoom(m);
			return true;
		}else if(exhibitionRoomMapper.getCountByMtitle(m.getErTitle())==0) {
			exhibitionRoomMapper.updateExhibitionRoom(m);
			return true;
		}
		return false;
	}

	@Override
	public void deleteExhibitionRoom(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			exhibitionRoomMapper.deleteExhibitionRoom(mId);
	}

	@Override
	public ExhibitionRoom getExhibitionRoomById(int mId) {
		// TODO Auto-generated method stub
		return exhibitionRoomMapper.getExhibitionRoomById(mId);
	}

	@Override
	public void updateExhibitionRoomSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			exhibitionRoomMapper.updateExhibitionRoomSetTop(mId);
	}

	@Override
	public void updateExhibitionRoomSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			exhibitionRoomMapper.updateExhibitionRoomSetUnTop(mId);
	}

	@Override
	public void updateExhibitionRoomPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			exhibitionRoomMapper.updateExhibitionRoomPublish(mId);
	}

	@Override
	public void updateExhibitionRoomUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			exhibitionRoomMapper.updateExhibitionRoomUnPublish(mId);
	}

}
