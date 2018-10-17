package com.flf.mapper;

import java.util.List;

import com.flf.entity.ActivityClass;


public interface ActivityClassMapper {
	//获取数据
	List<ActivityClass> listPageActivityClass(ActivityClass ac);
	//添加数据
	void insertActivityClass(ActivityClass ac);
	//修改数据
	void updateActivityClass(ActivityClass ac);
	//删除数据
	void deleteActivityClass(int acId);
	//根据id查找数据
	ActivityClass getActivityClassById(int acId);
	//启用
	void updateActivityClassEnabled(int acId);
	//取消启用
	void updateActivityClassUnEnabled(int acId);
	//更新访问量
	void updateActivityClassVisitCount(int acId);
	//名称计数
	int getCountByAcTitle(String acTitle);
	//获取id和标题
	List<ActivityClass> getActivityClassList();
	List<ActivityClass> getAcListByType(int type);
}
