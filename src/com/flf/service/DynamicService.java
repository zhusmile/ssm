package com.flf.service;

import java.util.List;

import com.flf.entity.Base;
import com.flf.entity.Dynamic;

public interface DynamicService {
	//获取数据
	List<Dynamic> listPageDynamic(Dynamic dy);
	//添加数据
	void insertDynamic(Dynamic dy);
	//修改数据
	void updateDynamic(Dynamic dy);
	//删除数据
	void deleteDynamic(Integer[] list);
	//根据id查找数据
	Dynamic getDynamicById(Integer dyId);
	//置顶
	void updateDynamicSetTop(Integer[] list);
	//取消置顶
	void updateDynamicSetUnTop(Integer[] list);
	//发布
	void updateDynamicPublish(Integer[] list);
	//取消发布
	void updateDynamicUnPublish(Integer[] list);
	//获取数据总量
	int getDynamicCount();
	//部委
	List<Dynamic> getBuWeiDyList();
	//地方
	List<Dynamic> getDiFangDyList();
	//社会团体
	List<Dynamic> getSHTTDyList();
	//基地
	List<Dynamic> getJidiDyList();
	//更新访问量
	void updatePageView(int id,int count);
	//全部
	List<Dynamic> getAllDyList();
	//
	List<Dynamic> getDyList(Dynamic dy);
	//
	List<Dynamic> getDylistToBaseExpPage(Base base);
	//
	List<Dynamic> getDylistByBase(int id);
}
