package com.flf.service;

import java.util.List;

import com.flf.entity.Assessment;

public interface AssessmentService {
	//获取数据
	List<Assessment> listPageAssessment(Assessment a);
	//添加数据
	boolean insertAssessment(Assessment a);
	//修改数据
	boolean updateAssessment(Assessment a);
	//删除数据
	void deleteAssessment(Integer[] list);
	//根据id查找数据
	Assessment getAssessmentById(int aId);
	//发布
	void updateAssessmentPublish(Integer[] list);
	//取消发布
	void updateAssessmentUnPublish(Integer[] list);
}
