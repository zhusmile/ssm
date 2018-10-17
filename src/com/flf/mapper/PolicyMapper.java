package com.flf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.flf.entity.Policy;

public interface PolicyMapper {
	List<Policy> listPagePolicy(Policy policy);
	//添加数据
	void insertPolicy(Policy policy);
	//修改数据
	void updatePolicy(Policy policy);
	//删除数据
	void deletePolicy(int pId);
	//根据id查找数据
	Policy getPolicyById(int pId);
	//置顶
	void updatePolicySetTop(int pId);
	//取消置顶
	void updatePolicySetUnTop(int pId);
	//发布
	void updatePolicyPublish(int pId);
	//取消发布
	void updatePolicyUnPublish(int pId);
	//计数 同名数据
	int getPolicyCountByTitle(String pTitle);
	//更新访问量
	void updatePageView(@Param("id") int id,@Param("count") int count);
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
	//获取热点政策
	List<Policy> getHotsByCycle(int type);
}
