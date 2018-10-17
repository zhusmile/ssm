package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Organization;
import com.flf.mapper.OrgMapper;
import com.flf.service.OrgService;

public class OrgServiceImpl implements OrgService{
	private OrgMapper orgMapper;

	public OrgMapper getOrgMapper() {
		return orgMapper;
	}

	public void setOrgMapper(OrgMapper orgMapper) {
		this.orgMapper = orgMapper;
	}

	@Override
	public List<Organization> listPageOrganization(Organization org) {
		// TODO Auto-generated method stub
		return orgMapper.listPageOrganization(org);
	}

	@Override
	public void insertOrganization(Organization org) {
		// TODO Auto-generated method stub
		orgMapper.insertOrganization(org);
	}

	@Override
	public void updateOrganization(Organization org) {
		// TODO Auto-generated method stub
		orgMapper.updateOrganization(org);
	}

	@Override
	public void deleteOrganization(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer orgId : list) {
			orgMapper.deleteOrganization(orgId);
		}
	}

	@Override
	public void updateOrganizationSetTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer orgId : list) {
			orgMapper.updateOrganizationSetTop(orgId);;
		}
	}

	@Override
	public void updateOrganizationSetUnTop(Integer[] list) {
		// TODO Auto-generated method stub
		for (Integer orgId : list) {
			orgMapper.updateOrganizationSetUnTop(orgId);;
		}
	}

	@Override
	public Organization getOrganizationById(int orgId) {
		// TODO Auto-generated method stub
		return orgMapper.getOrganizationById(orgId);
	}
}
