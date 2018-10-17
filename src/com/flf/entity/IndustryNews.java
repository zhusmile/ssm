package com.flf.entity;

import java.util.Date;

public class IndustryNews {
	private Integer inId;
	private String inTitle;
	private String inAbstract;
	private String inContent;
	private Integer inOrder;
	private Integer inPublish;
	private Date inPublishTime;
	private Date inModifyTime;
	private String inSource;
	private Integer inType;
	private Integer inSetTop;
	private Date inCreateTime;
	private Page page;
	public Integer getInId() {
		return inId;
	}
	public void setInId(Integer inId) {
		this.inId = inId;
	}
	public String getInTitle() {
		return inTitle;
	}
	public void setInTitle(String inTitle) {
		this.inTitle = inTitle;
	}
	public String getInAbstract() {
		return inAbstract;
	}
	public void setInAbstract(String inAbstract) {
		this.inAbstract = inAbstract;
	}
	public String getInContent() {
		return inContent;
	}
	public void setInContent(String inContent) {
		this.inContent = inContent;
	}
	public Integer getInOrder() {
		return inOrder;
	}
	public void setInOrder(Integer inOrder) {
		this.inOrder = inOrder;
	}
	public Integer getInPublish() {
		return inPublish;
	}
	public void setInPublish(Integer inPublish) {
		this.inPublish = inPublish;
	}
	public Date getInPublishTime() {
		return inPublishTime;
	}
	public void setInPublishTime(Date inPublishTime) {
		this.inPublishTime = inPublishTime;
	}
	public Date getInModifyTime() {
		return inModifyTime;
	}
	public void setInModifyTime(Date inModifyTime) {
		this.inModifyTime = inModifyTime;
	}
	public String getInSource() {
		return inSource;
	}
	public void setInSource(String inSource) {
		this.inSource = inSource;
	}
	public Integer getInType() {
		return inType;
	}
	public void setInType(Integer inType) {
		this.inType = inType;
	}
	public Integer getInSetTop() {
		return inSetTop;
	}
	public void setInSetTop(Integer inSetTop) {
		this.inSetTop = inSetTop;
	}
	public Date getInCreateTime() {
		return inCreateTime;
	}
	public void setInCreateTime(Date inCreateTime) {
		this.inCreateTime = inCreateTime;
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
		return "IndustryNews [inId=" + inId + ", inTitle=" + inTitle + ", inAbstract=" + inAbstract + ", inContent="
				+ inContent + ", inOrder=" + inOrder + ", inPublish=" + inPublish + ", inPublishTime=" + inPublishTime
				+ ", inModifyTime=" + inModifyTime + ", inSource=" + inSource + ", inType=" + inType + ", inSetTop="
				+ inSetTop + ", inCreateTime=" + inCreateTime + "]";
	}
	
}
