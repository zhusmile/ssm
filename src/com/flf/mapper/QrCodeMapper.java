package com.flf.mapper;

import java.util.List;

import com.flf.entity.QrCode;

public interface QrCodeMapper {
	//上传更新图片
	void updateQrCode(QrCode qCode);
	List<QrCode> listAllQrCode();
}
