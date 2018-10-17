package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Achievement;
import com.flf.mapper.AchievementMapper;
import com.flf.service.AchievementService;

public class AchievementServiceImpl implements AchievementService {
	private AchievementMapper achievementMapper;

	public AchievementMapper getAchievementMapper() {
		return achievementMapper;
	}

	public void setAchievementMapper(AchievementMapper achievementMapper) {
		this.achievementMapper = achievementMapper;
	}

	@Override
	public List<Achievement> listPageAchievement(Achievement ac) {
		// TODO Auto-generated method stub
		return achievementMapper.listPageAchievement(ac);
	}

	@Override
	public boolean insertAchievement(Achievement ac) {
		// TODO Auto-generated method stub
		if(achievementMapper.getCountByAcTitle(ac.getAcTitle())==0) {
			achievementMapper.insertAchievement(ac);
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean updateAchievement(Achievement ac) {
		//先判断是否修改标题，再判断要修改的标题是否和已有标题重复
		if(achievementMapper.getAchievementById(ac.getAcId()).getAcTitle().equals(ac.getAcTitle())) {
			System.out.println("标题不修改");
			achievementMapper.updateAchievement(ac);
			return true;
		}else if(achievementMapper.getCountByAcTitle(ac.getAcTitle())==0) {
			System.out.println("标题不重复");
			achievementMapper.updateAchievement(ac);
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public void deleteAchievement(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list) {
			achievementMapper.deleteAchievement(acId);
		}
	}

	@Override
	public Achievement getAchievementById(int acId) {
		// TODO Auto-generated method stub
		return achievementMapper.getAchievementById(acId);
	}

	@Override
	public void updateAcievementSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list) {
			achievementMapper.updateAchievementSetTop(acId);
		}
	}

	@Override
	public void updateAchievementSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list) {
			achievementMapper.updateAchievementSetUnTop(acId);
		}
	}

	@Override
	public void updateAchievementPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list) {
			achievementMapper.updateAchievementPublish(acId);
		}
	}

	@Override
	public void updateAchievementUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer acId : list) {
			achievementMapper.updateAchievementUnPublish(acId);
		}
	}
	
}
