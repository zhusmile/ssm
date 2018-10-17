package com.flf.entity;
//服务拓展-办事指南  实体类

import java.util.Date;

public class Assessment {
	private Integer aId;
	private String aContent;
	private String aTitle;
	private String aAbstract;
	private String aCreator;
	private Date aPublishTime;
	private Date aCreateTime;
	private String aModifier;
	private Date aModifyTime;
	private Integer aPublish;
	private String aSource;
	private Page page;
	private Integer aType;
	
	public Integer getaType() {
		return aType;
	}
	public void setaType(Integer aType) {
		this.aType = aType;
	}
	public String getaSource() {
		return aSource;
	}
	public void setaSource(String aSource) {
		this.aSource = aSource;
	}
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public String getaAbstract() {
		return aAbstract;
	}
	public void setaAbstract(String aAbstract) {
		this.aAbstract = aAbstract;
	}
	public String getaCreator() {
		return aCreator;
	}
	public void setaCreator(String aCreator) {
		this.aCreator = aCreator;
	}
	public Date getaPublishTime() {
		return aPublishTime;
	}
	public void setaPublishTime(Date aPublishTime) {
		this.aPublishTime = aPublishTime;
	}
	public Date getaCreateTime() {
		return aCreateTime;
	}
	public void setaCreateTime(Date aCreateTime) {
		this.aCreateTime = aCreateTime;
	}
	public String getaModifier() {
		return aModifier;
	}
	public void setaModifier(String aModifier) {
		this.aModifier = aModifier;
	}
	public Date getaModifyTime() {
		return aModifyTime;
	}
	public void setaModifyTime(Date aModifyTime) {
		this.aModifyTime = aModifyTime;
	}
	public Integer getaPublish() {
		return aPublish;
	}
	public void setaPublish(Integer aPublish) {
		this.aPublish = aPublish;
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
		return "Assessment [aId=" + aId + ", aContent=" + aContent + ", aTitle=" + aTitle + ", aAbstract=" + aAbstract
				+ ", aCreator=" + aCreator + ", aPublishTime=" + aPublishTime + ", aCreateTime=" + aCreateTime
				+ ", aModifier=" + aModifier + ", aModifyTime=" + aModifyTime + ", aPublish=" + aPublish + "]";
	}
	
}
