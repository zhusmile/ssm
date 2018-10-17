package com.flf.mapper;

import java.util.List;

import com.flf.entity.ExhibitionRoom;

public interface ExhibitionRoomMapper {
	//获取数据
	List<ExhibitionRoom> listPageExhibitionRoom(ExhibitionRoom er);
	//添加数据
	void insertExhibitionRoom(ExhibitionRoom er);
	//修改数据
	void updateExhibitionRoom(ExhibitionRoom er);
	//删除数据
	void deleteExhibitionRoom(int erId);
	//根据id查找数据
	ExhibitionRoom getExhibitionRoomById(int erId);
	//置顶
	void updateExhibitionRoomSetTop(int erId);
	//取消置顶
	void updateExhibitionRoomSetUnTop(int erId);
	//发布
	void updateExhibitionRoomPublish(int erId);
	//取消发布
	void updateExhibitionRoomUnPublish(int erId);
	//获取计数
	int getCountByMtitle(String mTitle);
}
