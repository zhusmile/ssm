package com.flf.entity;

import java.util.Date;

public class Achievement {
	private Integer acId;//id
	private String acTitle;//标题
	private Date acCreateTime;//创建时间
	private Date acPublishTime;//发布时间
	private Integer acPublish;//发布标识
	private Integer acSetTop;//置顶
	private Integer acOrder;//排序
	private String acContent;//文本
	private Page page;//分页
	public Integer getAcId() {
		return acId;
	}
	public void setAcId(Integer acId) {
		this.acId = acId;
	}
	public String getAcTitle() {
		return acTitle;
	}
	public void setAcTitle(String acTitle) {
		this.acTitle = acTitle;
	}
	public Date getAcCreateTime() {
		return acCreateTime;
	}
	public void setAcCreateTime(Date acCreateTime) {
		this.acCreateTime = acCreateTime;
	}
	public Date getAcPublishTime() {
		return acPublishTime;
	}
	public void setAcPublishTime(Date acPublishTime) {
		this.acPublishTime = acPublishTime;
	}
	public Integer getAcPublish() {
		return acPublish;
	}
	public void setAcPublish(Integer acPublish) {
		this.acPublish = acPublish;
	}
	public Integer getAcSetTop() {
		return acSetTop;
	}
	public void setAcSetTop(Integer acSetTop) {
		this.acSetTop = acSetTop;
	}
	public Integer getAcOrder() {
		return acOrder;
	}
	public void setAcOrder(Integer acOrder) {
		this.acOrder = acOrder;
	}
	public String getAcContent() {
		return acContent;
	}
	public void setAcContent(String acContent) {
		this.acContent = acContent;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "Achievement [acId=" + acId + ", acTitle=" + acTitle + ", acCreateTime=" + acCreateTime
				+ ", acPublishTime=" + acPublishTime + ", acPublish=" + acPublish + ", acSetTop=" + acSetTop
				+ ", acOrder=" + acOrder + ", acContent=" + acContent + "]";
	}
	
}
