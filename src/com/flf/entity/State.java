package com.flf.entity;
//建言献策实体类

import java.util.Date;

public class State {
	private Integer sId;//id
	private String sName;//姓名
	private String sUnit;//单位
	private String sMp;//电话号码
	private String sEmail;//电子邮箱
	private String sTitle;//标题
	private Date sTime;//时间
	private Integer sStatus;//状态 未审核 审核未通过 审核通过
	private String sContent;//内容
	private Page page;
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsUnit() {
		return sUnit;
	}
	public void setsUnit(String sUnit) {
		this.sUnit = sUnit;
	}
	public String getsMp() {
		return sMp;
	}
	public void setsMp(String sMp) {
		this.sMp = sMp;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public Date getsTime() {
		return sTime;
	}
	public void setsTime(Date sTime) {
		this.sTime = sTime;
	}
	public Integer getsStatus() {
		return sStatus;
	}
	public void setsStatus(Integer sStatus) {
		this.sStatus = sStatus;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
}
