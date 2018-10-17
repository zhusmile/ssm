package com.flf.service;

import java.util.List;

import com.flf.entity.SubjectClassfication;

public interface SubjectClassficationService {
	//获取or查找
	List<SubjectClassfication> listPageSubjectClassfication(SubjectClassfication subjectClassfication);
	//添加
	boolean insertSubjectClassfication(SubjectClassfication subjectClassfication);
	//修改
	boolean updateSubjectClassfication(SubjectClassfication subjectClassfication);
	//删除
	void deleteSubjectClassfication(Integer[] list);
	//根据id获取
	SubjectClassfication getSubjectClassficationById(int sId);
	List<SubjectClassfication> getSubList();
}
