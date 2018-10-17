package com.flf.entity;

import org.springframework.web.multipart.MultipartFile;
//二维码
public class QrCode {
	private Integer codeId;//对应表的id
	private MultipartFile file;//上传文件
	private String codeSrc;//上传文件的路径
	public Integer getCodeId() {
		return codeId;
	}
	public void setCodeId(Integer codeId) {
		this.codeId = codeId;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCodeSrc() {
		return codeSrc;
	}
	public void setCodeSrc(String codeSrc) {
		this.codeSrc = codeSrc;
	}
	@Override
	public String toString() {
		return "QrCode [codeId=" + codeId + ", codeSrc=" + codeSrc + "]";
	}
}
