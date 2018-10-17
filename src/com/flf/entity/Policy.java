package com.flf.entity;

import java.util.Date;




public class Policy {
	private Integer pId;//主键
	private String pTitle;//标题
	private String pIssueOrg;//发布机构
	private Integer pBelong;//政策隶属
	private String pClassfication;//政策分类
	private String pService;//创业服务
	private String pAbstract;//政策解读简介
	private String pInterviewvideoSrc;//访谈视频地址
	private String pGuest;//访谈嘉宾
	private String pEcosphere;//
	private String pIndex;//发文字号
	private String pIssuer;//发布人
	private String pTheClassfication;//主题分类
	private String pTimeAxis;//时间轴
	private String pArea;//区域
	private String pEntreGroup;//创业人群
	private String pIndustry;//行业
	private Integer pOrder;//排序
	private Integer pPublish;//发布标识
	private Integer pSetTop;//置顶标识
	private Date pInterviewTime;//访谈时间
	private String pInterviewAbstract;//访谈简介
	private String pContent;//政策内容
	private Date pIssueTime;//发布时间
	private String pModifier;//修改人
	private Date pModifyTime;//修改时间
	private String pInterviewImg;//访谈图标
	private Integer pageView;//访问量
	private Date searchStart;
	private Date searchEnd;
	private Page page;
	
	public Integer getPageView() {
		return pageView;
	}
	public void setPageView(Integer pageView) {
		this.pageView = pageView;
	}
	public String getpInterviewImg() {
		return pInterviewImg;
	}
	public void setpInterviewImg(String pInterviewImg) {
		this.pInterviewImg = pInterviewImg;
	}
	public String getpEcosphere() {
		return pEcosphere;
	}
	public void setpEcosphere(String pEcosphere) {
		this.pEcosphere = pEcosphere;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getpIssueOrg() {
		return pIssueOrg;
	}
	public void setpIssueOrg(String pIssueOrg) {
		this.pIssueOrg = pIssueOrg;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public Integer getpBelong() {
		return pBelong;
	}
	public void setpBelong(Integer pBelong) {
		this.pBelong = pBelong;
	}
	public String getpClassfication() {
		return pClassfication;
	}
	public void setpClassfication(String pClassfication) {
		this.pClassfication = pClassfication;
	}
	public String getpService() {
		return pService;
	}
	public void setpService(String pService) {
		this.pService = pService;
	}
	public String getpAbstract() {
		return pAbstract;
	}
	public void setpAbstract(String pAbstract) {
		this.pAbstract = pAbstract;
	}
	public String getpInterviewvideoSrc() {
		return pInterviewvideoSrc;
	}
	public void setpInterviewvideoSrc(String pInterviewvideoSrc) {
		this.pInterviewvideoSrc = pInterviewvideoSrc;
	}
	public String getpGuest() {
		return pGuest;
	}
	public void setpGuest(String pGuest) {
		this.pGuest = pGuest;
	}
	public String getpIndex() {
		return pIndex;
	}
	public void setpIndex(String pIndex) {
		this.pIndex = pIndex;
	}
	public String getpIssuer() {
		return pIssuer;
	}
	public void setpIssuer(String pIssuer) {
		this.pIssuer = pIssuer;
	}
	public String getpTheClassfication() {
		return pTheClassfication;
	}
	public void setpTheClassfication(String pTheClassfication) {
		this.pTheClassfication = pTheClassfication;
	}
	public String getpTimeAxis() {
		return pTimeAxis;
	}
	public void setpTimeAxis(String pTimeAxis) {
		this.pTimeAxis = pTimeAxis;
	}
	public String getpArea() {
		return pArea;
	}
	public void setpArea(String pArea) {
		this.pArea = pArea;
	}
	public String getpEntreGroup() {
		return pEntreGroup;
	}
	public void setpEntreGroup(String pEntreGroup) {
		this.pEntreGroup = pEntreGroup;
	}
	public String getpIndustry() {
		return pIndustry;
	}
	public void setpIndustry(String pIndustry) {
		this.pIndustry = pIndustry;
	}
	public Integer getpOrder() {
		return pOrder;
	}
	public void setpOrder(Integer pOrder) {
		this.pOrder = pOrder;
	}
	public Integer getpPublish() {
		return pPublish;
	}
	public void setpPublish(Integer pPublish) {
		this.pPublish = pPublish;
	}
	public Integer getpSetTop() {
		return pSetTop;
	}
	public void setpSetTop(Integer pSetTop) {
		this.pSetTop = pSetTop;
	}
	public Date getpInterviewTime() {
		return pInterviewTime;
	}
	public void setpInterviewTime(Date pInterviewTime) {
		this.pInterviewTime = pInterviewTime;
	}
	public String getpInterviewAbstract() {
		return pInterviewAbstract;
	}
	public void setpInterviewAbstract(String pInterviewAbstract) {
		this.pInterviewAbstract = pInterviewAbstract;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public Date getpIssueTime() {
		return pIssueTime;
	}
	public void setpIssueTime(Date pIssueTime) {
		this.pIssueTime = pIssueTime;
	}
	public String getpModifier() {
		return pModifier;
	}
	public void setpModifier(String pModifier) {
		this.pModifier = pModifier;
	}
	public Date getpModifyTime() {
		return pModifyTime;
	}
	public void setpModifyTime(Date pModifyTime) {
		this.pModifyTime = pModifyTime;
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
	@Override
	public String toString() {
		return "Policy [pId=" + pId + ", pTitle=" + pTitle + ", pIssueOrg=" + pIssueOrg + ", pBelong=" + pBelong
				+ ", pClassfication=" + pClassfication + ", pService=" + pService + ", pAbstract=" + pAbstract
				+ ", pInterviewvideoSrc=" + pInterviewvideoSrc + ", pGuest=" + pGuest + ", pEcosphere=" + pEcosphere
				+ ", pIndex=" + pIndex + ", pIssuer=" + pIssuer + ", pTheClassfication=" + pTheClassfication
				+ ", pTimeAxis=" + pTimeAxis + ", pArea=" + pArea + ", pEntreGroup=" + pEntreGroup + ", pIndustry="
				+ pIndustry + ", pOrder=" + pOrder + ", pPublish=" + pPublish + ", pSetTop=" + pSetTop
				+ ", pInterviewTime=" + pInterviewTime + ", pInterviewAbstract=" + pInterviewAbstract + ", pContent="
				+ pContent + ", pIssueTime=" + pIssueTime + ", pModifier=" + pModifier + ", pModifyTime=" + pModifyTime
				+ ", pInterviewImg=" + pInterviewImg + ", searchStart=" + searchStart + ", searchEnd=" + searchEnd
				+ "]";
	}
	

	
	
	
	
}
