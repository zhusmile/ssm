package com.flf.service;

import java.util.List;

import com.flf.entity.ActivityClass;

public interface ActivityClassService {
		//获取数据
		List<ActivityClass> listPageActivityClass(ActivityClass ac);
		//添加数据
		boolean insertActivityClass(ActivityClass ac);
		//修改数据
		boolean updateActivityClass(ActivityClass ac);
		//删除数据
		void deleteActivityClass(Integer[] list);
		//根据id查找数据
		ActivityClass getActivityClassById(int acId);
		//启用
		void updateActivityClassEnabled(Integer[] list);
		//取消启用
		void updateActivityClassUnEnabled(Integer[] list);
		//更新访问量
		void updateActivityClassVisitCount(int acId);
		//获取只有id和标题的数据
		List<ActivityClass> getActivityClassList();
		List<ActivityClass> getAcListByType(int type);
}
