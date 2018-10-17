package com.flf.service;

import java.util.List;

import com.flf.entity.QrCode;

public interface QrCodeService {
	//上传更新图片
	void updateQrCode(QrCode qCode);
	List<QrCode> listAllQrcode();
}
