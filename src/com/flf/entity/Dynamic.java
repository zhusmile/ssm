package com.flf.entity;

import java.util.Date;

public class Dynamic {
	private Integer dyId;//id
	private String dyTitle;//标题
	private Date dyCreateTime;//创建时间
	private String dyAbstract;//简介
	private Integer dyIssuer;//发布单位
	private String dyIssuerName;//发布单位名称
	private Integer dyLeader;//领导标记
	private Integer dyBase;//所属基地
	private Integer dyArea;//所属地区
	private Integer dyCaste;//所属社会团体
	private Integer dyType;//动态分类
	private String dySource;//来源
	private Integer dyPublish;//发布标识
	private Date dyPublishTime;//发布时间
	private Integer dyOrder;//排序
	private String dyContent;//正文
	private Integer dySetTop;//置顶
	private String dyImg;//图片(保存路径)
	private Date dyAutoPublishTime;//自动发布时间
	private Integer dyPageView;//访问量
	private Page page;
	private Date searchStart;
	private Date searchEnd;
	public Integer getDyId() {
		return dyId;
	}
	public void setDyId(Integer dyId) {
		this.dyId = dyId;
	}
	
	public String getDyTitle() {
		return dyTitle;
	}
	public void setDyTitle(String dyTitle) {
		this.dyTitle = dyTitle;
	}
	
	public Date getDyCreateTime() {
		return dyCreateTime;
	}
	public void setDyCreateTime(Date dyCreateTime) {
		this.dyCreateTime = dyCreateTime;
	}
	public String getDyAbstract() {
		return dyAbstract;
	}
	public void setDyAbstract(String dyAbstract) {
		this.dyAbstract = dyAbstract;
	}
	public Integer getDyIssuer() {
		return dyIssuer;
	}
	
	public void setDyIssuer(Integer dyIssuer) {
		this.dyIssuer = dyIssuer;
	}
	
	public String getDyIssuerName() {
		return dyIssuerName;
	}
	public void setDyIssuerName(String dyIssuerName) {
		this.dyIssuerName = dyIssuerName;
	}
	public Integer getDyLeader() {
		return dyLeader;
	}
	public void setDyLeader(Integer dyLeader) {
		this.dyLeader = dyLeader;
	}
	public Integer getDyBase() {
		return dyBase;
	}
	public void setDyBase(Integer dyBase) {
		this.dyBase = dyBase;
	}
	public Integer getDyArea() {
		return dyArea;
	}
	public void setDyArea(Integer dyArea) {
		this.dyArea = dyArea;
	}
	public Integer getDyCaste() {
		return dyCaste;
	}
	public void setDyCaste(Integer dyCaste) {
		this.dyCaste = dyCaste;
	}
	public Integer getDyType() {
		return dyType;
	}
	public void setDyType(Integer dyType) {
		this.dyType = dyType;
	}
	public String getDySource() {
		return dySource;
	}
	public void setDySource(String dySource) {
		this.dySource = dySource;
	}
	public Date getDyPublishTime() {
		return dyPublishTime;
	}
	public Integer getDyPublish() {
		return dyPublish;
	}
	public void setDyPublish(Integer dyPublish) {
		this.dyPublish = dyPublish;
	}
	public void setDyPublishTime(Date dyPublishTime) {
		this.dyPublishTime = dyPublishTime;
	}
	public Integer getDyOrder() {
		return dyOrder;
	}
	public void setDyOrder(Integer dyOrder) {
		this.dyOrder = dyOrder;
	}
	public String getDyContent() {
		return dyContent;
	}
	public void setDyContent(String dyContent) {
		this.dyContent = dyContent;
	}
	public Integer getDySetTop() {
		return dySetTop;
	}
	public void setDySetTop(Integer dySetTop) {
		this.dySetTop = dySetTop;
	}
	public String getDyImg() {
		return dyImg;
	}
	public void setDyImg(String dyImg) {
		this.dyImg = dyImg;
	}
	public Date getDyAutoPublishTime() {
		return dyAutoPublishTime;
	}
	public void setDyAutoPublishTime(Date dyAutoPublishTime) {
		this.dyAutoPublishTime = dyAutoPublishTime;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Date getSearchStart() {
		return searchStart;
	}
	public void setSearchStart(Date searchStart) {
		this.searchStart = searchStart;
	}
	public Date getSearchEnd() {
		return searchEnd;
	}
	public void setSearchEnd(Date searchEnd) {
		this.searchEnd = searchEnd;
	}
	public Integer getDyPageView() {
		return dyPageView;
	}
	public void setDyPageView(Integer dyPageView) {
		this.dyPageView = dyPageView;
	}
	@Override
	public String toString() {
		return "Dynamic [dyId=" + dyId + ", dyAbstract=" + dyAbstract + ", dyIssuer=" + dyIssuer + ", dyLeader="
				+ dyLeader + ", dyBase=" + dyBase + ", dyArea=" + dyArea + ", dyCaste=" + dyCaste + ", dyType=" + dyType
				+ ", dySource=" + dySource + ", dyPublishTime=" + dyPublishTime + ", dyOrder=" + dyOrder + ", dySetTop="
				+ dySetTop + ", dyImg=" + dyImg + ", dyAutoPublishTime=" + dyAutoPublishTime + ", searchStart="
				+ searchStart + ", searchEnd=" + searchEnd + "]";
	}
	
}
