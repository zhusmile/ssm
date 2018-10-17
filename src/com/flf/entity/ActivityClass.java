package com.flf.entity;

import java.util.Date;

public class ActivityClass {
	private Integer acId;//id
	private String acTitle;//活动标题
	private Integer acType;//活动类别
	private String acSource;//来源
	private String acAbstract;//活动简介
	private String acIssuer;//发布人
	private Date acPublishTime;//发布时间
	private String acModifier;//更新人
	private Date acModifyTime;//更新时间
	private Integer acEnabled;//启用状态
	private String acImg1;//活动预览图片
	private String acImg2;//banner图片
	private String acLink;//参与方式跳转链接
	private Integer acVisitCount;//页面访问量
	private Integer acAreaId;//所属区域id
	private String acAreaName;//所属区域名称
	private Page page;
	
	public Integer getAcAreaId() {
		return acAreaId;
	}
	public void setAcAreaId(Integer acAreaId) {
		this.acAreaId = acAreaId;
	}
	public String getAcAreaName() {
		return acAreaName;
	}
	public void setAcAreaName(String acAreaName) {
		this.acAreaName = acAreaName;
	}
	public String getAcSource() {
		return acSource;
	}
	public void setAcSource(String acSource) {
		this.acSource = acSource;
	}
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
	public Integer getAcType() {
		return acType;
	}
	public void setAcType(Integer acType) {
		this.acType = acType;
	}
	public String getAcAbstract() {
		return acAbstract;
	}
	public void setAcAbstract(String acAbstract) {
		this.acAbstract = acAbstract;
	}
	public String getAcIssuer() {
		return acIssuer;
	}
	public void setAcIssuer(String acIssuer) {
		this.acIssuer = acIssuer;
	}
	public Date getAcPublishTime() {
		return acPublishTime;
	}
	public void setAcPublishTime(Date acPublishTime) {
		this.acPublishTime = acPublishTime;
	}
	public String getAcModifier() {
		return acModifier;
	}
	public void setAcModifier(String acModifier) {
		this.acModifier = acModifier;
	}
	public Date getAcModifyTime() {
		return acModifyTime;
	}
	public void setAcModifyTime(Date acModifyTime) {
		this.acModifyTime = acModifyTime;
	}
	public Integer getAcEnabled() {
		return acEnabled;
	}
	public void setAcEnabled(Integer acEnabled) {
		this.acEnabled = acEnabled;
	}
	public String getAcImg1() {
		return acImg1;
	}
	public void setAcImg1(String acImg1) {
		this.acImg1 = acImg1;
	}
	public String getAcImg2() {
		return acImg2;
	}
	public void setAcImg2(String acImg2) {
		this.acImg2 = acImg2;
	}
	public String getAcLink() {
		return acLink;
	}
	public void setAcLink(String acLink) {
		this.acLink = acLink;
	}
	
	public Integer getAcVisitCount() {
		return acVisitCount;
	}
	public void setAcVisitCount(Integer acVisitCount) {
		this.acVisitCount = acVisitCount;
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
		return "ActivityClass [acId=" + acId + ", acTitle=" + acTitle + ", acType=" + acType + ", acAbstract="
				+ acAbstract + ", acIssuer=" + acIssuer + ", acPublishTime=" + acPublishTime + ", acModifier="
				+ acModifier + ", acModifyTime=" + acModifyTime + ", acEnabled=" + acEnabled + ", acImg1=" + acImg1
				+ ", acImg2=" + acImg2 + ", acLink=" + acLink + "]";
	}
	
}
