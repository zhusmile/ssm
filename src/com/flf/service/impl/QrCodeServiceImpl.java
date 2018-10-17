package com.flf.service.impl;

import java.util.List;

import com.flf.entity.QrCode;
import com.flf.mapper.QrCodeMapper;
import com.flf.service.QrCodeService;

public class QrCodeServiceImpl implements QrCodeService{
	private QrCodeMapper qrCodeMapper;
	
	public QrCodeMapper getQrCodeMapper() {
		return qrCodeMapper;
	}

	public void setQrCodeMapper(QrCodeMapper qrCodeMapper) {
		this.qrCodeMapper = qrCodeMapper;
	}

	@Override
	public void updateQrCode(QrCode qCode) {
		// TODO Auto-generated method stub
		qrCodeMapper.updateQrCode(qCode);
	}

	@Override
	public List<QrCode> listAllQrcode() {
		// TODO Auto-generated method stub
		return qrCodeMapper.listAllQrCode();
	}

}
