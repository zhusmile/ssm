package com.flf.service.impl;


import java.util.List;

import com.flf.entity.Policy;
import com.flf.mapper.PolicyMapper;
import com.flf.service.PolicyService;

public class PolicyServiceImpl implements PolicyService{
	private PolicyMapper policyMapper;

	public PolicyMapper getPolicyMapper() {
		return policyMapper;
	}

	public void setPolicyMapper(PolicyMapper policyMapper) {
		this.policyMapper = policyMapper;
	}

	@Override
	public List<Policy> listPagePolicy(Policy policy) {
		// TODO Auto-generated method stub
		return policyMapper.listPagePolicy(policy);
	}

	@Override
	public boolean insertPolicy(Policy policy) {
		// TODO Auto-generated method stub
		if(policyMapper.getPolicyCountByTitle(policy.getpTitle())==0) {
			policyMapper.insertPolicy(policy);
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePolicy(Policy policy) {
		// TODO Auto-generated method stub
		if(policy.getpTitle().equals(policyMapper.getPolicyById(policy.getpId()).getpTitle())) {
			policyMapper.updatePolicy(policy);
			return true;
		}else if(policyMapper.getPolicyCountByTitle(policy.getpTitle())==0) {
			policyMapper.updatePolicy(policy);
			return true;
		}
		return false;
	}

	@Override
	public void deletePolicy(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyMapper.deletePolicy(pId);
		}
	}

	@Override
	public Policy getPolicyById(int pId) {
		// TODO Auto-generated method stub
		return policyMapper.getPolicyById(pId);
	}

	@Override
	public void updatePolicySetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyMapper.updatePolicySetTop(pId);
		}
	}

	@Override
	public void updatePolicySetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyMapper.updatePolicySetUnTop(pId);
		}
	}

	@Override
	public void updatePolicyPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyMapper.updatePolicyPublish(pId);
		}
	}

	@Override
	public void updatePolicyUnPublish(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyMapper.updatePolicyUnPublish(pId);
		}
	}

	@Override
	public void updatePageView(int id,int count) {
		// TODO Auto-generated method stub
		policyMapper.updatePageView(id,count);
	}

	@Override
	public List<Policy> listPageBuWeiPolicy(Policy policy) {
		// TODO Auto-generated method stub
		return policyMapper.listPageBuWeiPolicy(policy);
	}

	@Override
	public List<Policy> listPageDifangPolicy(Policy policy) {
		// TODO Auto-generated method stub
		return policyMapper.listPageDifangPolicy(policy);
	}

	@Override
	public List<Policy> listPagePolicyOrderByPageView(Policy policy) {
		// TODO Auto-generated method stub
		return policyMapper.listPagePolicyOrderByPageView(policy);
	}

	@Override
	public List<Policy> getPolicyList(Policy policy) {
		// TODO Auto-generated method stub
		return policyMapper.getPolicyList(policy);
	}

	@Override
	public List<Policy> searchPolicy(String keyword) {
		// TODO Auto-generated method stub
		return policyMapper.searchPolicy(keyword);
	}

	@Override
	public void updatePageViewYear() {
		// TODO Auto-generated method stub
		policyMapper.updatePageViewYear();
	}

	@Override
	public void updatePageViewSeason() {
		// TODO Auto-generated method stub
		policyMapper.updatePageViewSeason();
	}

	@Override
	public void updatePageViewMonth() {
		// TODO Auto-generated method stub
		policyMapper.updatePageViewMonth();
	}

	@Override
	public void updatePageViewWeek() {
		// TODO Auto-generated method stub
		policyMapper.updatePageViewWeek();
	}

	@Override
	public List<Policy> getHotsByCycle(int type) {
		// TODO Auto-generated method stub
		return policyMapper.getHotsByCycle(type);
	}
	
}
