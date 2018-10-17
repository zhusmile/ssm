package com.flf.entity;

public class Area {
	private Integer aId;
	private String aName;
	private Integer aOrder;
	public Integer getaOrder() {
		return aOrder;
	}
	public void setaOrder(Integer aOrder) {
		this.aOrder = aOrder;
	}
	private Page page;
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
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
	
}
