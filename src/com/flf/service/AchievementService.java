package com.flf.service;

import java.util.List;

import com.flf.entity.Achievement;

public interface AchievementService {
	//获取数据
	List<Achievement> listPageAchievement(Achievement ac);
	//添加数据
	boolean insertAchievement(Achievement ac);
	//修改数据
	boolean updateAchievement(Achievement ac);
	//删除数据
	void deleteAchievement(Integer[] list);
	//根据id查找数据
	Achievement getAchievementById(int acId);
	//置顶
	void updateAcievementSetTop(Integer[] list);
	//取消置顶
	void updateAchievementSetUnTop(Integer[] list);
	//发布
	void updateAchievementPublish(Integer[] list);
	//取消发布
	void updateAchievementUnPublish(Integer[] list);
}
