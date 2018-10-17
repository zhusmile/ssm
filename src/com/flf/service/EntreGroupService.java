package com.flf.service;

import java.util.List;

import com.flf.entity.EntreGroup;

public interface EntreGroupService {
	//获取信息
	List<EntreGroup> listPageEntreGroup(EntreGroup entreGroup);
	//添加信息
	boolean insertEntreGroup(EntreGroup entreGroup);
	//删除信息
	void deleteEntreGroupById(int egId);
	//通过id 获取信息
	EntreGroup getEntreGroupById(int egId);
	//更新信息
	void updateEntreGroup(EntreGroup entreGroup);
	//设置置顶
	void updateEntreGroupSetTop(int egId);
	//取消置顶
	void updateEntreGroupSetunTop(int egId);
	//
	List<EntreGroup> getEGList();
}
