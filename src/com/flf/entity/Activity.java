package com.flf.entity;

import java.util.Date;

public class Activity {
	private Integer aId;//id
	private String aTitle;//活动标题
	private Integer aAreaId;//所属区域(id)
	private String aAreaName;//所属区域名称
	private Integer aType;//种类
	private String aDescript;//活动简介
	private Integer aIssuerOrg;//发布单位
	private String aIssuerName;//发布单位名称
	private String aIssuer;//发布人
	private Integer aPublish;//发布标识
	private Date aPublishTime;//发布时间
	private Date aCreateTime;//创建时间
	private String aSource;//来源
	private String aModifier;//修改人
	private Date aModifyTime;//修改时间
	private Integer aOrder;//排序
	private Integer aSetTop;//置顶	
	private String aImg;//图片路径
	private String aContent;//活动内容
	private Page page;//分页
	private Integer aPageView;//浏览量
	
	public Integer getaPageView() {
		return aPageView;
	}
	public void setaPageView(Integer aPageView) {
		this.aPageView = aPageView;
	}
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public Integer getaAreaId() {
		return aAreaId;
	}
	public void setaAreaId(Integer aAreaId) {
		this.aAreaId = aAreaId;
	}
	public String getaAreaName() {
		return aAreaName;
	}
	public void setaAreaName(String aAreaName) {
		this.aAreaName = aAreaName;
	}
	public Integer getaType() {
		return aType;
	}
	public void setaType(Integer aType) {
		this.aType = aType;
	}
	public String getaDescript() {
		return aDescript;
	}
	public void setaDescript(String aDescript) {
		this.aDescript = aDescript;
	}
	public Integer getaIssuerOrg() {
		return aIssuerOrg;
	}
	public void setaIssuerOrg(Integer aIssuerOrg) {
		this.aIssuerOrg = aIssuerOrg;
	}
	public String getaIssuerName() {
		return aIssuerName;
	}
	public void setaIssuerName(String aIssuerName) {
		this.aIssuerName = aIssuerName;
	}
	public String getaIssuer() {
		return aIssuer;
	}
	public void setaIssuer(String aIssuer) {
		this.aIssuer = aIssuer;
	}
	public Integer getaPublish() {
		return aPublish;
	}
	public void setaPublish(Integer aPublish) {
		this.aPublish = aPublish;
	}
	public Date getaPublishTime() {
		return aPublishTime;
	}
	public void setaPublishTime(Date aPublishTime) {
		this.aPublishTime = aPublishTime;
	}
	public String getaSource() {
		return aSource;
	}
	public void setaSource(String aSource) {
		this.aSource = aSource;
	}
	public String getaModifier() {
		return aModifier;
	}
	public void setaModifier(String aModifier) {
		this.aModifier = aModifier;
	}
	public Integer getaOrder() {
		return aOrder;
	}
	public void setaOrder(Integer aOrder) {
		this.aOrder = aOrder;
	}
	public Integer getaSetTop() {
		return aSetTop;
	}
	public void setaSetTop(Integer aSetTop) {
		this.aSetTop = aSetTop;
	}
	public Date getaModifyTime() {
		return aModifyTime;
	}
	public void setaModifyTime(Date aModifyTime) {
		this.aModifyTime = aModifyTime;
	}
	public String getaImg() {
		return aImg;
	}
	public void setaImg(String aImg) {
		this.aImg = aImg;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	public Date getaCreateTime() {
		return aCreateTime;
	}
	public void setaCreateTime(Date aCreateTime) {
		this.aCreateTime = aCreateTime;
	}
	@Override
	public String toString() {
		return "Activity [aId=" + aId + ", aTitle=" + aTitle + ", aAreaId=" + aAreaId + ", aAreaName=" + aAreaName
				+ ", aType=" + aType + ", aDescript=" + aDescript + ", aIssuerOrg=" + aIssuerOrg + ", aIssuerName="
				+ aIssuerName + ", aIssuer=" + aIssuer + ", aPublish=" + aPublish + ", aPublishTime=" + aPublishTime
				+ ", aCreateTime=" + aCreateTime + ", aSource=" + aSource + ", aModifier=" + aModifier
				+ ", aModifyTime=" + aModifyTime + ", aOrder=" + aOrder + ", aSetTop=" + aSetTop + ", aImg=" + aImg
				+ ", aContent=" + aContent + "]";
	}
	
	
}
