package com.flf.mapper;

import java.util.List;

import com.flf.entity.State;

public interface StateMapper {
	//获取信息
	List<State> listPageState(State state);
	//添加信息
	void insertState(State state);
	//删除信息
	void deleteStateById(int sId);
	//通过id 获取信息
	State getStateById(int sId);
	//审核通过
	void updateStateStatus(State state);
}
