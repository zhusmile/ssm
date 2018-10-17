package com.flf.entity;

public class Ecosphere {
	private Integer eId;
	private String eName;
	private Page page;
	public Integer geteId() {
		return eId;
	}
	public void seteId(Integer eId) {
		this.eId = eId;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
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
		return "Ecosphere [eId=" + eId + ", eName=" + eName + "]";
	}
	
	
}
