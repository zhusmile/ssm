package com.flf.mapper;

import java.util.List;

import com.flf.entity.Guest;

public interface GuestMapper {
	//获取数据
	List<Guest> listPageGuest(Guest guest);
	//添加数据
	void insertGuest(Guest guest);
	//更新数据
	void updateGuest(Guest guest);
	//删除数据
	void deleteGuest(int gId);
	//设置置顶
	void updateGuestSetTop(int gId);
	//解除置顶
	void updateGuestSetunTop(int gId);
	//根据guestid获取数据
	Guest getGuestById(int gId);
	//根据标题获取同标题的数据条数
	int getGuestCountBygTitle(String gTitle);
	//撤回
	void updateGuestUnpublish(int gId);
}
