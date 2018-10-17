package com.flf.entity;

import java.util.Date;

public class Guest {
	private Integer gId;//id
	private String gTitle;//标题
	private Integer gType;//所属活动类别
	private String gTypeName;//类别名称
	private String gIssuer;//发布人
	private Date gPublishTime;//发布时间
	private Date gCreateTime;//创建时间
	private String gModifier;//修改人
	private Date gModifyTime;//修改时间
	private String gImg;//图片路径
	private Integer gPublish;//发布标记
	private Integer gSetTop;//置顶
	private Integer gOrder;//排序
	private Page page;
	public String getgTypeName() {
		return gTypeName;
	}
	public void setgTypeName(String gTypeName) {
		this.gTypeName = gTypeName;
	}
	public Integer getgId() {
		return gId;
	}
	public void setgId(Integer gId) {
		this.gId = gId;
	}
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public Integer getgType() {
		return gType;
	}
	public void setgType(Integer gType) {
		this.gType = gType;
	}
	public String getgIssuer() {
		return gIssuer;
	}
	public void setgIssuer(String gIssuer) {
		this.gIssuer = gIssuer;
	}
	public Date getgPublishTime() {
		return gPublishTime;
	}
	public void setgPublishTime(Date gPublishTime) {
		this.gPublishTime = gPublishTime;
	}
	public Date getgCreateTime() {
		return gCreateTime;
	}
	public void setgCreateTime(Date gCreateTime) {
		this.gCreateTime = gCreateTime;
	}
	public String getgModifier() {
		return gModifier;
	}
	public void setgModifier(String gModifier) {
		this.gModifier = gModifier;
	}
	public Date getgModifyTime() {
		return gModifyTime;
	}
	public void setgModifyTime(Date gModifyTime) {
		this.gModifyTime = gModifyTime;
	}
	public String getgImg() {
		return gImg;
	}
	public void setgImg(String gImg) {
		this.gImg = gImg;
	}
	public Integer getgPublish() {
		return gPublish;
	}
	public void setgPublish(Integer gPublish) {
		this.gPublish = gPublish;
	}
	public Integer getgSetTop() {
		return gSetTop;
	}
	public void setgSetTop(Integer gSetTop) {
		this.gSetTop = gSetTop;
	}
	public Integer getgOrder() {
		return gOrder;
	}
	public void setgOrder(Integer gOrder) {
		this.gOrder = gOrder;
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
		return "Guest [gId=" + gId + ", gTitle=" + gTitle + ", gType=" + gType + ", gIssuer=" + gIssuer
				+ ", gPublishTime=" + gPublishTime + ", gCreateTime=" + gCreateTime + ", gModifier=" + gModifier
				+ ", gModifyTime=" + gModifyTime + ", gImg=" + gImg + ", gPublish=" + gPublish + ", gSetTop=" + gSetTop
				+ ", gOrder=" + gOrder + "]";
	}
	
}
