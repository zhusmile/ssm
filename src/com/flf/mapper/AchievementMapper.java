package com.flf.mapper;

import java.util.List;

import com.flf.entity.Achievement;

public interface AchievementMapper {
	//获取数据
	List<Achievement> listPageAchievement(Achievement ac);
	//添加数据
	void insertAchievement(Achievement ac);
	//修改数据
	void updateAchievement(Achievement ac);
	//删除数据
	void deleteAchievement(int acId);
	//根据id查找数据
	Achievement getAchievementById(int acId);
	//置顶
	void updateAchievementSetTop(int acId);
	//取消置顶
	void updateAchievementSetUnTop(int acId);
	//发布
	void updateAchievementPublish(int acId);
	//取消发布
	void updateAchievementUnPublish(int acId);
	//名称计数
	int getCountByAcTitle(String acTitle);
}
