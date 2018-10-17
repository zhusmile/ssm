package com.flf.service;

import java.util.List;

import com.flf.entity.Activity;

public interface ActivityService {
		//获取数据
		List<Activity> listPageActivity(Activity a);
		//添加数据
		void insertActivity(Activity a);
		//修改数据
		void updateActivity(Activity a);
		//删除数据
		void deleteActivity(Integer[] list);
		//根据id查找数据
		Activity getActivityById(int aId);
		//置顶
		void updateActivitySetTop(Integer[] list);
		//取消置顶
		void updateActivitySetUnTop(Integer[] list);
		//发布
		void updateActivityPublish(Integer[] list);
		//取消发布
		void updateActivityUnPublish(Integer[] list);
		//发布双创数据
		List<Activity> listPageSCZ(Activity a);
		//更新浏览量
		void updatePageView(int aId);
}
