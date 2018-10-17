package com.flf.mapper;

import java.util.List;

import com.flf.entity.Information;

public interface InfoMapper {
	//获取数据列表
	List<Information> listPageInformation(Information info);
	//添加数据
	void insertInformation(Information info);
	//修改数据
	void updateInformation(Information info);
	//删除数据
	void deleteInformation(int infoId);
	//置顶
	void updateInformationSetTop(int infoId);
	//取消置顶
	void updateInformationSetUnTop(int infoId);
	//根据id获取数据
	Information getInformationById(int infoId);
}
