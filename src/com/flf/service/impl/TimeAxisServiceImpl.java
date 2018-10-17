package com.flf.service.impl;

import java.util.List;

import com.flf.entity.TimeAxis;
import com.flf.mapper.TimeAxisMapper;
import com.flf.service.TimeAxisService;

public class TimeAxisServiceImpl implements TimeAxisService {
	private TimeAxisMapper timeAxisMapper;
	public TimeAxisMapper getTimeAxisMapper() {
		return timeAxisMapper;
	}

	public void setTimeAxisMapper(TimeAxisMapper timeAxisMapper) {
		this.timeAxisMapper = timeAxisMapper;
	}

	@Override
	public List<TimeAxis> listPageTimeAxis(TimeAxis timeAxis) {
		// TODO Auto-generated method stub
		return timeAxisMapper.listPageTimeAxis(timeAxis);
	}

	@Override
	public boolean insertTimeAxis(TimeAxis timeAxis) {
		// TODO Auto-generated method stub
		if(timeAxisMapper.getCountByName(timeAxis.gettName())==0) {
			timeAxisMapper.insertTimeAxis(timeAxis);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateTimeAxis(TimeAxis timeAxis) {
		// TODO Auto-generated method stub
		if(timeAxisMapper.getTimeAxisById(timeAxis.gettId()).gettName().equals(timeAxis.gettName())) {
			return true;
		}else if(timeAxisMapper.getCountByName(timeAxis.gettName())==0) {
			timeAxisMapper.updateTimeAxis(timeAxis);
			return true;
		}
		return false;
	}

	@Override
	public void deleteTimeAxis(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer tId : list) {
			timeAxisMapper.deleteTimeAxis(tId);
		}
	}

	@Override
	public TimeAxis getTimeAxisById(int tId) {
		// TODO Auto-generated method stub
		return timeAxisMapper.getTimeAxisById(tId);
	}

}