package com.flf.entity;
//吉祥物

import java.util.Date;

public class Mascot {
	private Integer mId;//id
	private String mTitle;//标题
	private String mContent;//正文
	private String mAbstract;//简介
	private String mIssuer;//发布人
	private Date mPublishTime;//发布时间
	private Date mCreateTime;//创建时间
	private String mModifier;//修改人
	private Date mModifyTime;//修改时间
	private String mImg;//图片路径
	private Integer mPublish;//发布标记
	private Integer mSetTop;//置顶
	private Integer mOrder;//排序
	private Page page;
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	
	public String getmContent() {
		return mContent;
	}
	public void setmContent(String mContent) {
		this.mContent = mContent;
	}
	public String getmAbstract() {
		return mAbstract;
	}
	public void setmAbstract(String mAbstract) {
		this.mAbstract = mAbstract;
	}
	public String getmIssuer() {
		return mIssuer;
	}
	public void setmIssuer(String mIssuer) {
		this.mIssuer = mIssuer;
	}
	public Date getmPublishTime() {
		return mPublishTime;
	}
	public void setmPublishTime(Date mPublishTime) {
		this.mPublishTime = mPublishTime;
	}
	public Date getmCreateTime() {
		return mCreateTime;
	}
	public void setmCreateTime(Date mCreateTime) {
		this.mCreateTime = mCreateTime;
	}
	public String getmModifier() {
		return mModifier;
	}
	public void setmModifier(String mModifier) {
		this.mModifier = mModifier;
	}
	public Date getmModifyTime() {
		return mModifyTime;
	}
	public void setmModifyTime(Date mModifyTime) {
		this.mModifyTime = mModifyTime;
	}
	public String getmImg() {
		return mImg;
	}
	public void setmImg(String mImg) {
		this.mImg = mImg;
	}
	
	public Integer getmPublish() {
		return mPublish;
	}
	public void setmPublish(Integer mPublish) {
		this.mPublish = mPublish;
	}
	public Integer getmSetTop() {
		return mSetTop;
	}
	public void setmSetTop(Integer mSetTop) {
		this.mSetTop = mSetTop;
	}
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	public Integer getmOrder() {
		return mOrder;
	}
	public void setmOrder(Integer mOrder) {
		this.mOrder = mOrder;
	}
	@Override
	public String toString() {
		return "Mascot [mId=" + mId + ", mTitle=" + mTitle + ", mAbstract=" + mAbstract + ", mIssuer=" + mIssuer
				+ ", mPublishTime=" + mPublishTime + ", mCreateTime=" + mCreateTime + ", mModifier=" + mModifier
				+ ", mModifyTime=" + mModifyTime + ", mImg=" + mImg + "]";
	}
	
}
