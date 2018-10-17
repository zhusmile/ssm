package com.flf.mapper;

import java.util.List;

import com.flf.entity.PolicyClassfication;

public interface PolicyClassficationMapper {
	//获取or查找
	List<PolicyClassfication> listPagePolicyClassfication(PolicyClassfication pc);
	//添加
	void insertPolicyClassfication(PolicyClassfication pc);
	//修改
	void updatePolicyClassfication(PolicyClassfication pc);
	//删除
	void deletePolicyClassfication(int pId);
	//根据id获取
	PolicyClassfication getPolicyClassficationById(int pId);
	//查找同名数据条数
	int getCountByName(String pName);
	//
	List<PolicyClassfication> getPCList();
}
