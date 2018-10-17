package com.flf.service.impl;

import java.util.List;

import com.flf.entity.State;
import com.flf.mapper.StateMapper;
import com.flf.service.StateService;

public class StateServiceImpl implements StateService{
	private StateMapper stateMapper;
	
	public StateMapper getStateMapper() {
		return stateMapper;
	}

	public void setStateMapper(StateMapper stateMapper) {
		this.stateMapper = stateMapper;
	}

	@Override
	public List<State> listPageState(State state) {
		// TODO Auto-generated method stub
		return stateMapper.listPageState(state);
	}

	@Override
	public void insertState(State state) {
		// TODO Auto-generated method stub
		stateMapper.insertState(state);
	}

	@Override
	public void deleteStateById(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer sId : list) {
			stateMapper.deleteStateById(sId);
		}
	}

	@Override
	public State getStateById(int sId) {
		// TODO Auto-generated method stub
		return stateMapper.getStateById(sId);
	}

	@Override
	public void updateStateStatus(State state) {
		// TODO Auto-generated method stub
		stateMapper.updateStateStatus(state);
	}


}
