package com.flf.service.impl;

import java.util.List;

import com.flf.entity.SubjectClassfication;
import com.flf.mapper.SubjectClassficationMapper;
import com.flf.service.SubjectClassficationService;

public class SubjectClassficationServiceImpl implements SubjectClassficationService {
	private SubjectClassficationMapper subjectClassficationMapper;
	public SubjectClassficationMapper getSubjectClassficationMapper() {
		return subjectClassficationMapper;
	}

	public void setSubjectClassficationMapper(SubjectClassficationMapper subjectClassficationMapper) {
		this.subjectClassficationMapper = subjectClassficationMapper;
	}

	@Override
	public List<SubjectClassfication> listPageSubjectClassfication(SubjectClassfication subjectClassfication) {
		// TODO Auto-generated method stub
		return subjectClassficationMapper.listPageSubjectClassfication(subjectClassfication);
	}

	@Override
	public boolean insertSubjectClassfication(SubjectClassfication subjectClassfication) {
		// TODO Auto-generated method stub
		if(subjectClassficationMapper.getCountByName(subjectClassfication.getsName())==0) {
			subjectClassficationMapper.insertSubjectClassfication(subjectClassfication);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateSubjectClassfication(SubjectClassfication subjectClassfication) {
		// TODO Auto-generated method stub
		if(subjectClassficationMapper.getSubjectClassficationById(subjectClassfication.getsId()).getsName().equals(subjectClassfication.getsName())) {
			return true;
		}else if(subjectClassficationMapper.getCountByName(subjectClassfication.getsName())==0) {
			subjectClassficationMapper.updateSubjectClassfication(subjectClassfication);
			return true;
		}
		return false;
	}

	@Override
	public void deleteSubjectClassfication(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer sId : list) {
			subjectClassficationMapper.deleteSubjectClassfication(sId);
		}
	}

	@Override
	public SubjectClassfication getSubjectClassficationById(int sId) {
		// TODO Auto-generated method stub
		return subjectClassficationMapper.getSubjectClassficationById(sId);
	}

	@Override
	public List<SubjectClassfication> getSubList() {
		// TODO Auto-generated method stub
		return subjectClassficationMapper.getSubList();
	}

}