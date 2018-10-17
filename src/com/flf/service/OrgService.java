package com.flf.service;

import java.util.List;

import com.flf.entity.Organization;

public interface OrgService {
	//获取数据列表
	List<Organization> listPageOrganization(Organization org);
	//添加数据
	void insertOrganization(Organization org);
	//修改数据
	void updateOrganization(Organization org);
	//删除数据
	void deleteOrganization(Integer[] list);
	//置顶
	void updateOrganizationSetTop(Integer[] list);
	//取消置顶
	void updateOrganizationSetUnTop(Integer[] list);
	//根据id获取数据
	Organization getOrganizationById(int orgId);
}
