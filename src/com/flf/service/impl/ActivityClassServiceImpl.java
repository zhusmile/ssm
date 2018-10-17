package com.flf.service.impl;

import java.util.List;

import com.flf.entity.ActivityClass;
import com.flf.mapper.ActivityClassMapper;
import com.flf.service.ActivityClassService;

public class ActivityClassServiceImpl implements ActivityClassService {
	private ActivityClassMapper activityClassMapper;

	public ActivityClassMapper getActivityClassMapper() {
		return activityClassMapper;
	}

	public void setActivityClassMapper(ActivityClassMapper activityClassMapper) {
		this.activityClassMapper = activityClassMapper;
	}

	@Override
	public List<ActivityClass> listPageActivityClass(ActivityClass ac) {
		// TODO Auto-generated method stub
		return activityClassMapper.listPageActivityClass(ac);
	}

	@Override
	public boolean insertActivityClass(ActivityClass ac) {
		// TODO Auto-generated method stub
		if(activityClassMapper.getCountByAcTitle(ac.getAcTitle())==0) {
			activityClassMapper.insertActivityClass(ac);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateActivityClass(ActivityClass ac) {
		// TODO Auto-generated method stub
		if(ac.getAcTitle().equals(activityClassMapper.getActivityClassById(ac.getAcId()).getAcTitle())) {
			activityClassMapper.updateActivityClass(ac);
			return true;
		}else if(activityClassMapper.getCountByAcTitle(ac.getAcTitle())==0) {
			activityClassMapper.updateActivityClass(ac);
			return true;
		}
		return false;
	}

	@Override
	public void deleteActivityClass(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list)
			activityClassMapper.deleteActivityClass(acId);
	}

	@Override
	public ActivityClass getActivityClassById(int acId) {
		// TODO Auto-generated method stub
		return activityClassMapper.getActivityClassById(acId);
	}

	@Override
	public void updateActivityClassEnabled(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list)
			activityClassMapper.updateActivityClassEnabled(acId);
	}

	@Override
	public void updateActivityClassUnEnabled(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list)
			activityClassMapper.updateActivityClassUnEnabled(acId);
	}

	@Override
	public void updateActivityClassVisitCount(int acId) {
		// TODO Auto-generated method stub
		activityClassMapper.updateActivityClassVisitCount(acId);
	}

	@Override
	public List<ActivityClass> getActivityClassList() {
		// TODO Auto-generated method stub
		return activityClassMapper.getActivityClassList();
	}

	@Override
	public List<ActivityClass> getAcListByType(int type) {
		// TODO Auto-generated method stub
		return activityClassMapper.getAcListByType(type);
	}
	
}
