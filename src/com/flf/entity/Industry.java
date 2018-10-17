package com.flf.entity;

public class Industry {
	private Integer iId;
	private String iName;
	private Page page;
	public Integer getiId() {
		return iId;
	}
	public void setiId(Integer iId) {
		this.iId = iId;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public Page getPage() {
		if (page==null) {
			page=new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "Industry [iId=" + iId + ", iName=" + iName + "]";
	}
	
	
}
