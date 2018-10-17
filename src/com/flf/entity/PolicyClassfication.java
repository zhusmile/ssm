package com.flf.entity;

public class PolicyClassfication {
	private Integer pId;
	private String pName;
	private Page page;
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
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
		return "PolicyClassfication [pId=" + pId + ", pName=" + pName + "]";
	}
	
}
