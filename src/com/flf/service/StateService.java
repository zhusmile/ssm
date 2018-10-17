package com.flf.service;

import java.util.List;

import com.flf.entity.State;

public interface StateService {
	//获取信息
	List<State> listPageState(State state);
	//添加信息
	void insertState(State state);
	//删除信息
	void deleteStateById(Integer[] list);
	//通过id 获取信息
	State getStateById(int sId);
	//审核通过
	void updateStateStatus(State state);
}
