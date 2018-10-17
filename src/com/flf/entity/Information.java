package com.flf.entity;

public class Information {
	private Integer infoId;//id 对应表 tb_information 字段info_id
	private String infoName;//名称 对应字段info_name
	private String infoLink;//链接 对应字段info_link
	private Integer infoType;//类别 对应字段info_type
	private Integer infoOrder;//排序 对应字段 info_order
	private Integer infoSetTop;//置顶状态 对应字段info_setTop
	private Page page;//分页
	public Integer getInfoId() {
		return infoId;
	}
	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}
	public String getInfoName() {
		return infoName;
	}
	public void setInfoName(String infoName) {
		this.infoName = infoName;
	}
	public String getInfoLink() {
		return infoLink;
	}
	public void setInfoLink(String infoLink) {
		this.infoLink = infoLink;
	}
	public Integer getInfoType() {
		return infoType;
	}
	public void setInfoType(Integer infoType) {
		this.infoType = infoType;
	}
	public Integer getInfoOrder() {
		return infoOrder;
	}
	public void setInfoOrder(Integer infoOrder) {
		this.infoOrder = infoOrder;
	}
	public Integer getInfoSetTop() {
		return infoSetTop;
	}
	public void setInfoSetTop(Integer infoSetTop) {
		this.infoSetTop = infoSetTop;
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
		return "Information [infoId=" + infoId + ", infoName=" + infoName + ", infoLink=" + infoLink + ", infoType="
				+ infoType + ", infoOrder=" + infoOrder + ", infoSetTop=" + infoSetTop + ", page=" + page + "]";
	}
	
}
