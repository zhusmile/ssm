package com.flf.entity;



public class Media {
	private Integer mId;//id 
	private String mName;//媒体名称
	private Integer mType1;//业务类型
	private Integer mType2;//媒体类型
	private Integer mOrder;//排序
	private String mLink;//链接
	private String mImg;//图片保存路径
	private Integer mSetTop;//置顶
	private Page page;//分页
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Integer getmType1() {
		return mType1;
	}
	public void setmType1(Integer mType1) {
		this.mType1 = mType1;
	}
	public Integer getmType2() {
		return mType2;
	}
	public void setmType2(Integer mType2) {
		this.mType2 = mType2;
	}
	
	public String getmImg() {
		return mImg;
	}
	public void setmImg(String mImg) {
		this.mImg = mImg;
	}
	public Integer getmOrder() {
		return mOrder;
	}
	public void setmOrder(Integer mOrder) {
		this.mOrder = mOrder;
	}
	public String getmLink() {
		return mLink;
	}
	public void setmLink(String mLink) {
		this.mLink = mLink;
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
	@Override
	public String toString() {
		return "Media [mId=" + mId + ", mName=" + mName + ", mType1=" + mType1 + ", mType2=" + mType2 + ", mOrder="
				+ mOrder + ", mLink=" + mLink + "]";
	}
	
}
