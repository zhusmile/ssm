package com.flf.service.impl;

import java.util.List;

import com.flf.entity.PolicyClassfication;
import com.flf.mapper.PolicyClassficationMapper;
import com.flf.service.PolicyClassficationService;

public class PolicyClassficationServiceImpl implements PolicyClassficationService{
	private PolicyClassficationMapper policyClassficationMapper;
	
	public PolicyClassficationMapper getPolicyClassficationMapper() {
		return policyClassficationMapper;
	}

	public void setPolicyClassficationMapper(PolicyClassficationMapper policyClassficationMapper) {
		this.policyClassficationMapper = policyClassficationMapper;
	}

	@Override
	public List<PolicyClassfication> listPagePolicyClassfication(PolicyClassfication pc) {
		// TODO Auto-generated method stub
		return policyClassficationMapper.listPagePolicyClassfication(pc);
	}

	@Override
	public boolean insertPolicyClassfication(PolicyClassfication pc) {
		// TODO Auto-generated method stub
		if(policyClassficationMapper.getCountByName(pc.getpName())==0) {
			policyClassficationMapper.insertPolicyClassfication(pc);
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePolicyClassfication(PolicyClassfication pc) {
		// TODO Auto-generated method stub
		if(policyClassficationMapper.getPolicyClassficationById(pc.getpId()).getpName().equals(pc.getpName())){
			return true;
		}else if(policyClassficationMapper.getCountByName(pc.getpName())==0) {
			policyClassficationMapper.insertPolicyClassfication(pc);
			return true;
		}
		return false;
	}

	@Override
	public void deletePolicyClassfication(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer pId : list) {
			policyClassficationMapper.deletePolicyClassfication(pId);
		}
	}
	@Override
	public PolicyClassfication getPolicyClassficationById(int pId) {
		// TODO Auto-generated method stub
		return policyClassficationMapper.getPolicyClassficationById(pId);
	}

	@Override
	public List<PolicyClassfication> getPCList() {
		// TODO Auto-generated method stub
		return policyClassficationMapper.getPCList();
	}

}
