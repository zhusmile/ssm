package com.flf.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Advert {
	private Integer adId;//id 对应 表tb_advertise 字段ad_id (以下注释中表名相同，省略)
	private String adName;//名称 对应字段ad_name
	private String adSrc;//上传图片的保存路径 对应 字段ad_src
	private MultipartFile file;//上传图片
	private String adIssuer;//插入用户       对应字段ad_issuer
	private Date adAddTime;//插入时间          对应字段ad_addTime
	private String adModifier;//更新用户 对应字段ad_modifier
	private Date adChangeTime;//更新时间 对应字段ad_changeTime
	private Integer adOrder;//排序               对应字段ad_order
	private Integer adSetTop;//置顶状态    对应字段ad_setTop
	private Page page;//用于前端页面列表分页
	private String adLink;//链接 对应字段ad_link
	public Integer getAdId() {
		return adId;
	}
	public void setAdId(Integer adId) {
		this.adId = adId;
	}
	public String getAdSrc() {
		return adSrc;
	}
	
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public void setAdSrc(String adSrc) {
		this.adSrc = adSrc;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getAdIssuer() {
		return adIssuer;
	}
	public void setAdIssuer(String adIssuer) {
		this.adIssuer = adIssuer;
	}
	public Date getAdAddTime() {
		return adAddTime;
	}
	public void setAdAddTime(Date adAddTime) {
		this.adAddTime = adAddTime;
	}
	public String getAdModifier() {
		return adModifier;
	}
	public void setAdModifier(String adModifier) {
		this.adModifier = adModifier;
	}
	public Date getAdChangeTime() {
		return adChangeTime;
	}
	public void setAdChangeTime(Date adChangeTime) {
		this.adChangeTime = adChangeTime;
	}
	public Integer getAdOrder() {
		return adOrder;
	}
	public void setAdOrder(Integer adOrder) {
		this.adOrder = adOrder;
	}
	public Integer getAdSetTop() {
		return adSetTop;
	}
	public void setAdSetTop(Integer adSetTop) {
		this.adSetTop = adSetTop;
	}
	public Page getPage() {
		if(page==null) {
			page = new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "Advertisement [adId=" + adId + ", adName=" + adName + ", adSrc=" + adSrc 
				+ ", adIssuer=" + adIssuer + ", adAddTime=" + adAddTime + ", adModifier=" + adModifier
				+ ", adChangeTime=" + adChangeTime + ", adOrder=" + adOrder + ", adSetTop=" + adSetTop + ", adLink=" + adLink + "]";
	}
	public String getAdLink() {
		return adLink;
	}
	public void setAdLink(String adLink) {
		this.adLink = adLink;
	}
	
}
