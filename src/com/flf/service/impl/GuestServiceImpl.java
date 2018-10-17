package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Guest;
import com.flf.mapper.GuestMapper;
import com.flf.service.GuestService;

public class GuestServiceImpl implements GuestService {
	private GuestMapper guestMapper;
	
	public GuestMapper getGuestMapper() {
		return guestMapper;
	}

	public void setGuestMapper(GuestMapper guestMapper) {
		this.guestMapper = guestMapper;
	}

	@Override
	public List<Guest> listPageGuest(Guest guest) {
		// TODO Auto-generated method stub
		return guestMapper.listPageGuest(guest);
	}

	@Override
	public boolean insertGuest(Guest guest) {
		// TODO Auto-generated method stub
		if(guestMapper.getGuestCountBygTitle(guest.getgTitle())==0) {
			guestMapper.insertGuest(guest);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateGuest(Guest guest) {
		// TODO Auto-generated method stub
		if(guest.getgTitle().equals(guestMapper.getGuestById(guest.getgId()).getgTitle())) {
			guestMapper.updateGuest(guest);
			return true;
		}else if(guestMapper.getGuestCountBygTitle(guest.getgTitle())==0) {
			guestMapper.updateGuest(guest);
			return true;
		}
		return false;
		
	}

	@Override
	public void deleteGuest(Integer[] listOfgId) {
		// TODO Auto-generated method stub
		for (Integer gId : listOfgId) {
			guestMapper.deleteGuest(gId);
		}
	}

	@Override
	public void updateGuestSetTop(Integer[] listOfgId) {
		// TODO Auto-generated method stub
		for (Integer gId : listOfgId) {
			guestMapper.updateGuestSetTop(gId);
		}
	}

	@Override
	public void updateGuestSetunTop(Integer[] listOfgId) {
		// TODO Auto-generated method stub
		for (Integer gId : listOfgId) {
			guestMapper.updateGuestSetunTop(gId);
		}
	}

	@Override
	public Guest getGuestById(int gId) {
		// TODO Auto-generated method stub
		return guestMapper.getGuestById(gId);
	}

	@Override
	public void updateGuestUnpublish(Integer[] listOfgId) {
		// TODO Auto-generated method stub
		for (Integer gId : listOfgId) {
			guestMapper.updateGuestUnpublish(gId);
		}
	}

}
