package com.flf.entity;

import org.springframework.web.multipart.MultipartFile;

public class GeneralAdvert {
	private Integer gaId;//id
	private String gaName;//名称
	private Integer gaType;//类别
	private String gaLink;//链接
	private String gaSrc;//上传文件的保存路径
	private MultipartFile file;//上传文件
	private Integer gaOrder;//排序
	private Integer gaSetTop;//置顶
	private Page page;//分页
	public Integer getGaId() {
		return gaId;
	}
	public void setGaId(Integer gaId) {
		this.gaId = gaId;
	}
	public String getGaName() {
		return gaName;
	}
	public void setGaName(String gaName) {
		this.gaName = gaName;
	}
	public Integer getGaType() {
		return gaType;
	}
	public void setGaType(Integer gaType) {
		this.gaType = gaType;
	}
	public String getGaLink() {
		return gaLink;
	}
	public void setGaLink(String gaLink) {
		this.gaLink = gaLink;
	}
	public String getGaSrc() {
		return gaSrc;
	}
	public void setGaSrc(String gaSrc) {
		this.gaSrc = gaSrc;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Integer getGaOrder() {
		return gaOrder;
	}
	public void setGaOrder(Integer gaOrder) {
		this.gaOrder = gaOrder;
	}
	public Integer getGaSetTop() {
		return gaSetTop;
	}
	public void setGaSetTop(Integer gaSetTop) {
		this.gaSetTop = gaSetTop;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "GeneralAdvert [gaId=" + gaId + ", gaName=" + gaName + ", gaType=" + gaType + ", gaLink=" + gaLink
				+ ", gaSrc=" + gaSrc + ", gaOrder=" + gaOrder + ", gaSetTop=" + gaSetTop + "]";
	}
	
}
