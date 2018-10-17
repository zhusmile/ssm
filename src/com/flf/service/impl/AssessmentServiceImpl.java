package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Assessment;
import com.flf.mapper.AssessmentMapper;
import com.flf.service.AssessmentService;

public class AssessmentServiceImpl implements AssessmentService {
	private AssessmentMapper assessmentMapper;
	

	public AssessmentMapper getAssessmentMapper() {
		return assessmentMapper;
	}

	public void setAssessmentMapper(AssessmentMapper assessmentMapper) {
		this.assessmentMapper = assessmentMapper;
	}

	@Override
	public List<Assessment> listPageAssessment(Assessment a) {
		// TODO Auto-generated method stub
		return assessmentMapper.listPageAssessment(a);
	}

	@Override
	public boolean insertAssessment(Assessment a) {
		// TODO Auto-generated method stub
		if(assessmentMapper.getCountByTitle(a.getaTitle())==0) {
			assessmentMapper.insertAssessment(a);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateAssessment(Assessment a) {
		// TODO Auto-generated method stub
		if(assessmentMapper.getAssessmentById(a.getaId()).getaTitle().equals(a.getaTitle())) {
			assessmentMapper.updateAssessment(a);
			return true;
		}else if(assessmentMapper.getCountByTitle(a.getaTitle())==0) {
			assessmentMapper.updateAssessment(a);
			return true;
		}
		return false;
	}

	@Override
	public void deleteAssessment(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			assessmentMapper.deleteAssessment(aId);
		}
	}

	@Override
	public Assessment getAssessmentById(int aId) {
		// TODO Auto-generated method stub
		return assessmentMapper.getAssessmentById(aId);
	}

	@Override
	public void updateAssessmentPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			assessmentMapper.updateAssessmentPublish(aId);
		}
	}

	@Override
	public void updateAssessmentUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer aId : list) {
			assessmentMapper.updateAssessmentUnPublish(aId);
		}
	}
	
}
