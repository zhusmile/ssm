package com.flf.service;

import java.util.List;

import com.flf.entity.ExhibitionRoom;

public interface ExhibitionRoomService {
	//获取数据
	List<ExhibitionRoom> listPageExhibitionRoom(ExhibitionRoom er);
	//添加数据
	boolean insertExhibitionRoom(ExhibitionRoom er);
	//修改数据
	boolean updateExhibitionRoom(ExhibitionRoom er);
	//删除数据
	void deleteExhibitionRoom(Integer[] list);
	//根据id查找数据
	ExhibitionRoom getExhibitionRoomById(int erId);
	//置顶
	void updateExhibitionRoomSetTop(Integer[] list);
	//取消置顶
	void updateExhibitionRoomSetUnTop(Integer[] list);
	//发布
	void updateExhibitionRoomPublish(Integer[] list);
	//取消发布
	void updateExhibitionRoomUnPublish(Integer[] list);
}
