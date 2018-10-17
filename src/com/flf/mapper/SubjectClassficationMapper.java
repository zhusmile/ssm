package com.flf.mapper;

import java.util.List;

import com.flf.entity.SubjectClassfication;

public interface SubjectClassficationMapper {
	//获取or查找
	List<SubjectClassfication> listPageSubjectClassfication(SubjectClassfication subjectClassfication);
	//添加
	void insertSubjectClassfication(SubjectClassfication subjectClassfication);
	//修改
	void updateSubjectClassfication(SubjectClassfication subjectClassfication);
	//删除
	void deleteSubjectClassfication(int sId);
	//根据id获取
	SubjectClassfication getSubjectClassficationById(int sId);
	//查找同名数据条数
	int getCountByName(String sName);
	List<SubjectClassfication> getSubList();
}
