package com.flf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.flf.entity.Base;
import com.flf.entity.Dynamic;


public interface DynamicMapper {
	//获取数据
	List<Dynamic> listPageDynamic(Dynamic dy);
	//添加数据
	void insertDynamic(Dynamic dy);
	//修改数据
	void updateDynamic(Dynamic dy);
	//删除数据
	void deleteDynamic(int dyId);
	//根据id查找数据
	Dynamic getDynamicById(int dyId);
	//置顶
	void updateDynamicSetTop(int dyId);
	//取消置顶
	void updateDynamicSetUnTop(int dyId);
	//发布
	void updateDynamicPublish(int dyId);
	//取消发布
	void updateDynamicUnPublish(int dyId);
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
	//全部
	List<Dynamic> getAllDyList();
	//
	List<Dynamic> getDyList(Dynamic dy);
	//更新访问量
	void updatePageView(@Param("id")int id,@Param("count")int count);
	//根据基地的类型和批次查找相应的动态
	List<Dynamic> getDylistToBaseExpPage(Base base);
	//根据所属基地查找动态
	List<Dynamic> getDylistByBase(int id);
}
