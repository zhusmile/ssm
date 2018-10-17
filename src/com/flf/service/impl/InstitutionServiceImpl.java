package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Institution;
import com.flf.mapper.InstitutionMapper;
import com.flf.service.InstitutionService;

public class InstitutionServiceImpl implements InstitutionService {
	private InstitutionMapper institutionMapper;
	

	public InstitutionMapper getInstitutionMapper() {
		return institutionMapper;
	}



	public void setInstitutionMapper(InstitutionMapper institutionMapper) {
		this.institutionMapper = institutionMapper;
	}



	@Override
	public List<Institution> getInstitutionList() {
		// TODO Auto-generated method stub
		return institutionMapper.getInstitutionList();
	}

}
