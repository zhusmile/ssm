package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Ecosphere;
import com.flf.mapper.EcosphereMapper;
import com.flf.service.EcosphereService;

public class EcosphereServiceImpl implements EcosphereService {
	private EcosphereMapper ecosphereMapper;
	public EcosphereMapper getEcosphereMapper() {
		return ecosphereMapper;
	}

	public void setEcosphereMapper(EcosphereMapper ecosphereMapper) {
		this.ecosphereMapper = ecosphereMapper;
	}

	@Override
	public List<Ecosphere> listPageEcosphere(Ecosphere ecosphere) {
		// TODO Auto-generated method stub
		return ecosphereMapper.listPageEcosphere(ecosphere);
	}

	@Override
	public boolean insertEcosphere(Ecosphere ecosphere) {
		// TODO Auto-generated method stub
		if(ecosphereMapper.getCountByName(ecosphere.geteName())==0) {
			ecosphereMapper.insertEcosphere(ecosphere);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEcosphere(Ecosphere ecosphere) {
		// TODO Auto-generated method stub
		if(ecosphereMapper.getEcosphereById(ecosphere.geteId()).geteName().equals(ecosphere.geteName())) {
			return true;
		}else if(ecosphereMapper.getCountByName(ecosphere.geteName())==0) {
			ecosphereMapper.updateEcosphere(ecosphere);
			return true;
		}
		return false;
	}

	@Override
	public void deleteEcosphere(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer eId : list) {
			ecosphereMapper.deleteEcosphere(eId);
		}
	}

	@Override
	public Ecosphere getEcosphereById(int eId) {
		// TODO Auto-generated method stub
		return ecosphereMapper.getEcosphereById(eId);
	}

}
