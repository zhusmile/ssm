package com.flf.service;

import java.util.List;

import com.flf.entity.PolicyClassfication;


public interface PolicyClassficationService {
	//获取or查找
	List<PolicyClassfication> listPagePolicyClassfication(PolicyClassfication pc);
	//添加
	boolean insertPolicyClassfication(PolicyClassfication pc);
	//修改
	boolean updatePolicyClassfication(PolicyClassfication pc);
	//删除
	void deletePolicyClassfication(Integer[] list);
	//根据id获取
	PolicyClassfication getPolicyClassficationById(int pId);
	//
	List<PolicyClassfication> getPCList();
}
