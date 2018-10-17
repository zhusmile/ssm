package com.flf.mapper;

import java.util.List;

import com.flf.entity.Mascot;

public interface MascotMapper {
	//获取数据
	List<Mascot> listPageMascot(Mascot m);
	//添加数据
	void insertMascot(Mascot m);
	//修改数据
	void updateMascot(Mascot m);
	//删除数据
	void deleteMascot(int mId);
	//根据id查找数据
	Mascot getMascotById(int mId);
	//置顶
	void updateMascotSetTop(int mId);
	//取消置顶
	void updateMascotSetUnTop(int mId);
	//发布
	void updateMascotPublish(int mId);
	//取消发布
	void updateMascotUnPublish(int mId);
	//获取计数
	int getCountByMtitle(String mTitle);
}
