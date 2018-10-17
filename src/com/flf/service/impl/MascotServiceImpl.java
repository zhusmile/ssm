package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Mascot;
import com.flf.mapper.MascotMapper;
import com.flf.service.MascotService;

public class MascotServiceImpl implements MascotService{
	private MascotMapper mascotMapper;
	
	public MascotMapper getMascotMapper() {
		return mascotMapper;
	}

	public void setMascotMapper(MascotMapper mascotMapper) {
		this.mascotMapper = mascotMapper;
	}

	@Override
	public List<Mascot> listPageMascot(Mascot m) {
		// TODO Auto-generated method stub
		return mascotMapper.listPageMascot(m);
	}

	@Override
	public boolean insertMascot(Mascot m) {
		// TODO Auto-generated method stub
		if(mascotMapper.getCountByMtitle(m.getmTitle())==0) {
			mascotMapper.insertMascot(m);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateMascot(Mascot m) {
		// TODO Auto-generated method stub
		if(mascotMapper.getMascotById(m.getmId()).getmTitle().equals(m.getmTitle())) {
			mascotMapper.updateMascot(m);
			return true;
		}else if(mascotMapper.getCountByMtitle(m.getmTitle())==0) {
			mascotMapper.updateMascot(m);
			return true;
		}
		return false;
	}

	@Override
	public void deleteMascot(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			mascotMapper.deleteMascot(mId);
	}

	@Override
	public Mascot getMascotById(int mId) {
		// TODO Auto-generated method stub
		return mascotMapper.getMascotById(mId);
	}

	@Override
	public void updateMascotSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			mascotMapper.updateMascotSetTop(mId);
	}

	@Override
	public void updateMascotSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			mascotMapper.updateMascotSetUnTop(mId);
	}

	@Override
	public void updateMascotPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			mascotMapper.updateMascotPublish(mId);
	}

	@Override
	public void updateMascotUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer mId : list)
			mascotMapper.updateMascotUnPublish(mId);
	}

}
