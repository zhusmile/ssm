package com.flf.service;

import java.util.List;

import com.flf.entity.Mascot;

public interface MascotService {
	//获取数据
	List<Mascot> listPageMascot(Mascot m);
	//添加数据
	boolean insertMascot(Mascot m);
	//修改数据
	boolean updateMascot(Mascot m);
	//删除数据
	void deleteMascot(Integer[] list);
	//根据id查找数据
	Mascot getMascotById(int mId);
	//置顶
	void updateMascotSetTop(Integer[] list);
	//取消置顶
	void updateMascotSetUnTop(Integer[] list);
	//发布
	void updateMascotPublish(Integer[] list);
	//取消发布
	void updateMascotUnPublish(Integer[] list);
}
