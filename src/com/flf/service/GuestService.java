package com.flf.service;

import java.util.List;

import com.flf.entity.Guest;

public interface GuestService {
		//获取数据
	List<Guest> listPageGuest(Guest guest);
	//添加数据
	boolean insertGuest(Guest guest);
	//更新数据
	boolean updateGuest(Guest guest);
	//删除数据
	void deleteGuest(Integer[] listOfgId);
	//设置置顶
	void updateGuestSetTop(Integer[] listOfgId);
	//解除置顶
	void updateGuestSetunTop(Integer[] listOfgId);
	//根据guestid获取数据
	Guest getGuestById(int gId);
	//撤回
	void updateGuestUnpublish(Integer[] listOfgId);
}
