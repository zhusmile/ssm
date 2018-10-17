package com.flf.entity;

import java.util.Date;


public class Base {
	private Integer bId;//id
	private Integer bArea;//所属区域
	private String bAreaName;//所属区域名称
	private String bName;//基地名称
	private Integer bBatch;//批次
	private Integer bType;//基地种类
	private Integer bIssuerOrg;//发布单位代码
	private String bIssuerOrgName;//发布单位名称
	private String bCreator;//创建人
	private Date bCreateTime;//创建时间
	private String bModifier;//修改人
	private Date bModifyTime;//修改时间
	private Integer bOrder;//排序
	private Integer bSetTop;//置顶
	private String bFileSrc;//文件路径
	private String bTitle1;//第一标题
	private String bTitle2;
	private String bTitle3;
	private String bTitle4;
	private String bTitle5;
	private String bTitle6;
	private String bTitle7;
	private String bTitle8;
	private String bTitle9;
	private String bContent1;//第一内容
	private String bContent2;
	private String bContent3;
	private String bContent4;
	private String bContent5;
	private String bContent6;
	private String bContent7;
	private Page page;
	public Integer getbId() {
		return bId;
	}
	public void setbId(Integer bId) {
		this.bId = bId;
	}
	public Integer getbArea() {
		return bArea;
	}
	public void setbArea(Integer bArea) {
		this.bArea = bArea;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	
	public String getbAreaName() {
		return bAreaName;
	}
	public void setbAreaName(String bAreaName) {
		this.bAreaName = bAreaName;
	}
	public Integer getbBatch() {
		return bBatch;
	}
	public void setbBatch(Integer bBatch) {
		this.bBatch = bBatch;
	}
	public Integer getbType() {
		return bType;
	}
	public void setbType(Integer bType) {
		this.bType = bType;
	}
	public Integer getbIssuerOrg() {
		return bIssuerOrg;
	}
	public void setbIssuerOrg(Integer bIssuerOrg) {
		this.bIssuerOrg = bIssuerOrg;
	}
	public String getbIssuerOrgName() {
		return bIssuerOrgName;
	}
	public void setbIssuerOrgName(String bIssuerOrgName) {
		this.bIssuerOrgName = bIssuerOrgName;
	}
	public String getbCreator() {
		return bCreator;
	}
	public void setbCreator(String bCreator) {
		this.bCreator = bCreator;
	}
	public Date getbCreateTime() {
		return bCreateTime;
	}
	public void setbCreateTime(Date bCreateTime) {
		this.bCreateTime = bCreateTime;
	}
	public String getbModifier() {
		return bModifier;
	}
	public void setbModifier(String bModifier) {
		this.bModifier = bModifier;
	}
	public Date getbModifyTime() {
		return bModifyTime;
	}
	public void setbModifyTime(Date bModifyTime) {
		this.bModifyTime = bModifyTime;
	}
	public Integer getbOrder() {
		return bOrder;
	}
	public void setbOrder(Integer bOrder) {
		this.bOrder = bOrder;
	}
	public Integer getbSetTop() {
		return bSetTop;
	}
	public void setbSetTop(Integer bSetTop) {
		this.bSetTop = bSetTop;
	}
	public String getbFileSrc() {
		return bFileSrc;
	}
	public void setbFileSrc(String bFileSrc) {
		this.bFileSrc = bFileSrc;
	}
	public String getbTitle1() {
		return bTitle1;
	}
	public void setbTitle1(String bTitle1) {
		this.bTitle1 = bTitle1;
	}
	public String getbTitle2() {
		return bTitle2;
	}
	public void setbTitle2(String bTitle2) {
		this.bTitle2 = bTitle2;
	}
	public String getbTitle3() {
		return bTitle3;
	}
	public void setbTitle3(String bTitle3) {
		this.bTitle3 = bTitle3;
	}
	public String getbTitle4() {
		return bTitle4;
	}
	public void setbTitle4(String bTitle4) {
		this.bTitle4 = bTitle4;
	}
	public String getbTitle5() {
		return bTitle5;
	}
	public void setbTitle5(String bTitle5) {
		this.bTitle5 = bTitle5;
	}
	public String getbTitle6() {
		return bTitle6;
	}
	public void setbTitle6(String bTitle6) {
		this.bTitle6 = bTitle6;
	}
	public String getbTitle7() {
		return bTitle7;
	}
	public void setbTitle7(String bTitle7) {
		this.bTitle7 = bTitle7;
	}
	public String getbTitle8() {
		return bTitle8;
	}
	public void setbTitle8(String bTitle8) {
		this.bTitle8 = bTitle8;
	}
	public String getbTitle9() {
		return bTitle9;
	}
	public void setbTitle9(String bTitle9) {
		this.bTitle9 = bTitle9;
	}
	public String getbContent1() {
		return bContent1;
	}
	public void setbContent1(String bContent1) {
		this.bContent1 = bContent1;
	}
	public String getbContent2() {
		return bContent2;
	}
	public void setbContent2(String bContent2) {
		this.bContent2 = bContent2;
	}
	public String getbContent3() {
		return bContent3;
	}
	public void setbContent3(String bContent3) {
		this.bContent3 = bContent3;
	}
	public String getbContent4() {
		return bContent4;
	}
	public void setbContent4(String bContent4) {
		this.bContent4 = bContent4;
	}
	public String getbContent5() {
		return bContent5;
	}
	public void setbContent5(String bContent5) {
		this.bContent5 = bContent5;
	}
	public String getbContent6() {
		return bContent6;
	}
	public void setbContent6(String bContent6) {
		this.bContent6 = bContent6;
	}
	public String getbContent7() {
		return bContent7;
	}
	public void setbContent7(String bContent7) {
		this.bContent7 = bContent7;
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
		return "Base [bId=" + bId + ", bArea=" + bArea + ", bAreaName=" + bAreaName + ", bName=" + bName + ", bBatch="
				+ bBatch + ", bType=" + bType + ", bIssuerOrg=" + bIssuerOrg + ", bIssuerOrgName=" + bIssuerOrgName
				+ ", bCreator=" + bCreator + ", bCreateTime=" + bCreateTime + ", bModifier=" + bModifier
				+ ", bModifyTime=" + bModifyTime + ", bOrder=" + bOrder + ", bSetTop=" + bSetTop + ", bFileSrc="
				+ bFileSrc + "]";
	}
	
}
