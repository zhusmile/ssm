package com.flf.mapper;

import java.util.List;

import com.flf.entity.Activity;

public interface ActivityMapper {
	//获取数据
	List<Activity> listPageActivity(Activity a);
	//添加数据
	void insertActivity(Activity a);
	//修改数据
	void updateActivity(Activity a);
	//删除数据
	void deleteActivity(int aId);
	//根据id查找数据
	Activity getActivityById(int aId);
	//置顶
	void updateActivitySetTop(int aId);
	//取消置顶
	void updateActivitySetUnTop(int aId);
	//发布
	void updateActivityPublish(int aId);
	//取消发布
	void updateActivityUnPublish(int aId);
	//获取双创周活动数据(主会场和分会场)
	List<Activity> listPageSCZ(Activity a);
	//更新浏览量
	void updatePageView(int aId);
}
