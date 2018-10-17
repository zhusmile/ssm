package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Activity;
import com.flf.mapper.ActivityMapper;
import com.flf.service.ActivityService;

public class ActivityServiceImpl implements ActivityService{
	private ActivityMapper activityMapper;
	
	public ActivityMapper getActivityMapper() {
		return activityMapper;
	}

	public void setActivityMapper(ActivityMapper activityMapper) {
		this.activityMapper = activityMapper;
	}

	@Override
	public List<Activity> listPageActivity(Activity a) {
		// TODO Auto-generated method stub
		return activityMapper.listPageActivity(a);
	}

	@Override
	public void insertActivity(Activity a) {
		// TODO Auto-generated method stub
		activityMapper.insertActivity(a);
	}

	@Override
	public void updateActivity(Activity a) {
		// TODO Auto-generated method stub
		activityMapper.updateActivity(a);
	}

	@Override
	public void deleteActivity(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			activityMapper.deleteActivity(aId);
		}
	}

	@Override
	public Activity getActivityById(int aId) {
		// TODO Auto-generated method stub
		return activityMapper.getActivityById(aId);
	}

	@Override
	public void updateActivitySetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			activityMapper.updateActivitySetUnTop(aId);
		}
	}

	@Override
	public void updateActivityPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			activityMapper.updateActivityPublish(aId);
		}
	}

	@Override
	public void updateActivityUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			activityMapper.updateActivityUnPublish(aId);
		}
	}

	@Override
	public void updateActivitySetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			activityMapper.updateActivitySetTop(aId);
		}
	}
	@Override
	public List<Activity> listPageSCZ(Activity a) {
		// TODO Auto-generated method stub
		return activityMapper.listPageSCZ(a);
	}

	@Override
	public void updatePageView(int aId) {
		// TODO Auto-generated method stub
		activityMapper.updatePageView(aId);
	}

}
