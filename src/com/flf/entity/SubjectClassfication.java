package com.flf.entity;

public class SubjectClassfication {
	private Integer sId;
	private String sName;
	private Page page;
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Page getPage() {
		if(page==null) {
			page=new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "SubjectClassfication [sId=" + sId + ", sName=" + sName + "]";
	}
	
}
