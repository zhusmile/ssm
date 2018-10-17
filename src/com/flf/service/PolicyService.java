package com.flf.service;

import java.util.List;

import com.flf.entity.Policy;

public interface PolicyService {
	List<Policy> listPagePolicy(Policy policy);
	//添加数据
	boolean insertPolicy(Policy policy);
	//修改数据
	boolean updatePolicy(Policy policy);
	//删除数据
	void deletePolicy(Integer[] list);
	//根据id查找数据
	Policy getPolicyById(int pId);
	//置顶
	void updatePolicySetTop(Integer[] list);
	//取消置顶
	void updatePolicySetUnTop(Integer[] list);
	//发布
	void updatePolicyPublish(Integer[] list);
	//取消发布
	void updatePolicyUnPublish(Integer[] list);
	//更新访问量
	void updatePageView(int id,int count);
	//获取部委数据
	List<Policy> listPageBuWeiPolicy(Policy policy);
	//获取地方数据
	List<Policy> listPageDifangPolicy(Policy policy);
	//按访问量获取数据
	List<Policy> listPagePolicyOrderByPageView(Policy policy);
	//
	List<Policy> getPolicyList(Policy policy);
	List<Policy> searchPolicy(String keyword);
	//清空访问量(年,季度,月份,周)
	void updatePageViewYear();
	void updatePageViewSeason();
	void updatePageViewMonth();
	void updatePageViewWeek();
	List<Policy> getHotsByCycle(int type);
}
