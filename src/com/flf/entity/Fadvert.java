package com.flf.entity;
//金融服务宣传位 特殊单独写
public class Fadvert {
	private Integer fId;//id 对应表tb_finadvert 字段fa_id
	private String fName;//名称 对应字段fa_name
	private String fType;//类别 对应字段fa_type
	private String fDescrip;//描述 对应字段fa_descrip
	private String fLink;//链接 对应字段fa_link
	private Integer fOrder;//排序 对应字段fa_order
	private Integer fSetTop;//置顶 对应字段fa_setTop
	private Page page;
	public Page getPage() {
		if(page==null)
			page=new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Integer getfId() {
		return fId;
	}
	public void setfId(Integer fId) {
		this.fId = fId;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfType() {
		return fType;
	}
	public void setfType(String fType) {
		this.fType = fType;
	}
	public String getfDescrip() {
		return fDescrip;
	}
	public void setfDescrip(String fDescrip) {
		this.fDescrip = fDescrip;
	}
	public String getfLink() {
		return fLink;
	}
	public void setfLink(String fLink) {
		this.fLink = fLink;
	}
	public Integer getfOrder() {
		return fOrder;
	}
	public void setfOrder(Integer fOrder) {
		this.fOrder = fOrder;
	}
	public Integer getfSetTop() {
		return fSetTop;
	}
	public void setfSetTop(Integer fSetTop) {
		this.fSetTop = fSetTop;
	}
	@Override
	public String toString() {
		return "Fadvert [fId=" + fId + ", fName=" + fName + ", fType=" + fType + ", fDescrip=" + fDescrip + ", fLink="
				+ fLink + ", fOrder=" + fOrder + ", fSetTop=" + fSetTop + "]";
	}
	
}
