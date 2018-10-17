package com.flf.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Banner {
	//实体类banner 对应数据库ssm的表tb_banner
	private Integer bannerId;//id 对应 tb_banner banner_id
	private String bannerName;//名称 对应  tb_banner banner_name
	private String bannerType;//类别 对应 tb_banner banner_type
	private String bannerLink;//链接 对应 tb_banner banner_link
	private String modifier;//修改人 对应 tb_banner banner_modifier
	private String issuer;//发布人 对应 tb_banner banner_issuer
	private Date addTime;//添加时间 对应tb_banner banner_addTime
	private Date changeTime;//修改时间 对应tb_banner banner_changeTime
	private Integer bannerOrder;//排序  对应 tb_banner banner_order升序
	private Integer bannerSet;//置顶设置 对应 tb_banner banner_set 升序 1: "已置顶" 2："未置顶"
	private MultipartFile file;//接收上传文件
	private String bannerSrc;//上传文件的路径 对应tb_banner banner_src
	private Page page;
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Integer getBannerId() {
		return bannerId;
	}
	public void setBannerId(Integer bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerName() {
		return bannerName;
	}
	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	public String getBannerType() {
		return bannerType;
	}
	public void setBannerType(String bannerType) {
		this.bannerType = bannerType;
	}
	public String getBannerLink() {
		return bannerLink;
	}
	public void setBannerLink(String bannerLink) {
		this.bannerLink = bannerLink;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public Date getChangeTime() {
		return changeTime;
	}
	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}
	public Integer getBannerOrder() {
		return bannerOrder;
	}
	public void setBannerOrder(Integer bannerOrder) {
		this.bannerOrder = bannerOrder;
	}
	public Integer getBannerSet() {
		return bannerSet;
	}
	public void setBannerSet(Integer bannerSet) {
		this.bannerSet = bannerSet;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBannerSrc() {
		return bannerSrc;
	}
	public void setBannerSrc(String bannerSrc) {
		this.bannerSrc = bannerSrc;
	}
	
}
