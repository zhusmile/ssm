package com.flf.mapper;

import java.util.List;

import com.flf.entity.Assessment;

public interface AssessmentMapper {
	//获取数据
	List<Assessment> listPageAssessment(Assessment a);
	//添加数据
	void insertAssessment(Assessment a);
	//修改数据
	void updateAssessment(Assessment a);
	//删除数据
	void deleteAssessment(int aId);
	//根据id查找数据
	Assessment getAssessmentById(int aId);
	//发布
	void updateAssessmentPublish(int aId);
	//取消发布
	void updateAssessmentUnPublish(int aId);
	//获取计数
	int getCountByTitle(String aTitle);
}
