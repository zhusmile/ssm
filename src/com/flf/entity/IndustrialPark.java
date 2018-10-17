package com.flf.entity;

public class IndustrialPark {
	private Integer ipId;//id
	private String ipName;//名称
	private Integer ipOrder;//排序
	private String ipLink;//链接
	private String ipImg;//图片路径
	private Integer ipSetTop;//置顶
	private Page page;
	public Integer getIpId() {
		return ipId;
	}
	public void setIpId(Integer ipId) {
		this.ipId = ipId;
	}
	public String getIpName() {
		return ipName;
	}
	public void setIpName(String ipName) {
		this.ipName = ipName;
	}
	public Integer getIpOrder() {
		return ipOrder;
	}
	public void setIpOrder(Integer ipOrder) {
		this.ipOrder = ipOrder;
	}
	public String getIpLink() {
		return ipLink;
	}
	public void setIpLink(String ipLink) {
		this.ipLink = ipLink;
	}
	public String getIpImg() {
		return ipImg;
	}
	public void setIpImg(String ipImg) {
		this.ipImg = ipImg;
	}
	public Integer getIpSetTop() {
		return ipSetTop;
	}
	public void setIpSetTop(Integer ipSetTop) {
		this.ipSetTop = ipSetTop;
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
		return "IndustrialPark [ipId=" + ipId + ", ipName=" + ipName + ", ipOrder=" + ipOrder + ", ipLink=" + ipLink
				+ ", ipImg=" + ipImg + ", ipSetTop=" + ipSetTop + "]";
	}
	
}
