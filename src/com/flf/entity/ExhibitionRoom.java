package com.flf.entity;

import java.util.Date;

public class ExhibitionRoom {
	private Integer erId;//id
	private String erTitle;//标题
	private String erContent;//正文
	private String erAbstract;//简介
	private String erIssuer;//发布人
	private Date erPublishTime;//发布时间
	private Date erCreateTime;//创建时间
	private String erModifier;//修改人
	private Date erModifyTime;//修改时间
	private String erImg;//图片路径
	private Integer erPublish;//发布标记
	private Integer erSetTop;//置顶
	private Integer erOrder;//排序
	private Page page;
	public Integer getErId() {
		return erId;
	}
	public void setErId(Integer erId) {
		this.erId = erId;
	}
	public String getErTitle() {
		return erTitle;
	}
	public void setErTitle(String erTitle) {
		this.erTitle = erTitle;
	}
	public String getErContent() {
		return erContent;
	}
	public void setErContent(String erContent) {
		this.erContent = erContent;
	}
	public String getErAbstract() {
		return erAbstract;
	}
	public void setErAbstract(String erAbstract) {
		this.erAbstract = erAbstract;
	}
	public String getErIssuer() {
		return erIssuer;
	}
	public void setErIssuer(String erIssuer) {
		this.erIssuer = erIssuer;
	}
	public Date getErPublishTime() {
		return erPublishTime;
	}
	public void setErPublishTime(Date erPublishTime) {
		this.erPublishTime = erPublishTime;
	}
	public Date getErCreateTime() {
		return erCreateTime;
	}
	public void setErCreateTime(Date erCreateTime) {
		this.erCreateTime = erCreateTime;
	}
	public String getErModifier() {
		return erModifier;
	}
	public void setErModifier(String erModifier) {
		this.erModifier = erModifier;
	}
	public Date getErModifyTime() {
		return erModifyTime;
	}
	public void setErModifyTime(Date erModifyTime) {
		this.erModifyTime = erModifyTime;
	}
	public String getErImg() {
		return erImg;
	}
	public void setErImg(String erImg) {
		this.erImg = erImg;
	}
	public Integer getErPublish() {
		return erPublish;
	}
	public void setErPublish(Integer erPublish) {
		this.erPublish = erPublish;
	}
	public Integer getErSetTop() {
		return erSetTop;
	}
	public void setErSetTop(Integer erSetTop) {
		this.erSetTop = erSetTop;
	}
	public Integer getErOrder() {
		return erOrder;
	}
	public void setErOrder(Integer erOrder) {
		this.erOrder = erOrder;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "ExhibitionRoom [erId=" + erId + ", erTitle=" + erTitle + ", erContent=" + erContent + ", erAbstract="
				+ erAbstract + ", erIssuer=" + erIssuer + ", erPublishTime=" + erPublishTime + ", erCreateTime="
				+ erCreateTime + ", erModifier=" + erModifier + ", erModifyTime=" + erModifyTime + ", erImg=" + erImg
				+ ", erPublish=" + erPublish + ", erSetTop=" + erSetTop + ", erOrder=" + erOrder + "]";
	}
	
}
