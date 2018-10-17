package com.flf.entity;

import java.util.Date;

public class News {
	private Integer nId;
	private String nTitle;
	private String nAbstract;
	private String nContent;
	private Integer nOrder;
	private Integer nPublish;
	private Date nPublishTime;
	private Date nModifyTime;
	private String nSource;
	private Integer nType;
	private Integer nSetTop;
	private Date nCreateTime;
	private Integer nPageView;
	private Page page;
	public Integer getnId() {
		return nId;
	}
	public void setnId(Integer nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnAbstract() {
		return nAbstract;
	}
	public void setnAbstract(String nAbstract) {
		this.nAbstract = nAbstract;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Integer getnOrder() {
		return nOrder;
	}
	public void setnOrder(Integer nOrder) {
		this.nOrder = nOrder;
	}
	public Integer getnPublish() {
		return nPublish;
	}
	public void setnPublish(Integer nPublish) {
		this.nPublish = nPublish;
	}
	public Date getnPublishTime() {
		return nPublishTime;
	}
	public void setnPublishTime(Date nPublishTime) {
		this.nPublishTime = nPublishTime;
	}
	public String getnSource() {
		return nSource;
	}
	public void setnSource(String nSource) {
		this.nSource = nSource;
	}
	public Integer getnType() {
		return nType;
	}
	public void setnType(Integer nType) {
		this.nType = nType;
	}
	public Page getPage() {
		if(page==null) {
			page=new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Integer getnSetTop() {
		return nSetTop;
	}
	public void setnSetTop(Integer nSetTop) {
		this.nSetTop = nSetTop;
	}
	
	public Date getnCreateTime() {
		return nCreateTime;
	}
	public void setnCreateTime(Date nCreateTime) {
		this.nCreateTime = nCreateTime;
	}
	public Date getnModifyTime() {
		return nModifyTime;
	}
	public void setnModifyTime(Date nModifyTime) {
		this.nModifyTime = nModifyTime;
	}
	
	public Integer getnPageView() {
		return nPageView;
	}
	public void setnPageView(Integer nPageView) {
		this.nPageView = nPageView;
	}
	@Override
	public String toString() {
		return "News [nId=" + nId + ", nTitle=" + nTitle + ", nAbstract=" + nAbstract + ", nContent=" + nContent
				+ ", nOrder=" + nOrder + ", nPublish=" + nPublish + ", nPublishTime=" + nPublishTime + ", nModifyTime="
				+ nModifyTime + ", nSource=" + nSource + ", nType=" + nType + ", nSetTop=" + nSetTop + ", nCreateTime="
				+ nCreateTime + "]";
	}
	
}
