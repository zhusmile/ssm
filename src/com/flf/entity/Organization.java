package com.flf.entity;

import org.springframework.web.multipart.MultipartFile;

public class Organization {
	private Integer orgId;//id
	private String orgName;//名称
	private String orgSrc;//上传文件保存路径
	private MultipartFile file;//上传文件
	private String orgLink;//链接
	private Integer orgOrder;//排序
	private Integer orgSetTop;//置顶
	private Integer orgType;//类别
	private Page page;//分页
	public Integer getOrgId() {
		return orgId;
	}
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgSrc() {
		return orgSrc;
	}
	public void setOrgSrc(String orgSrc) {
		this.orgSrc = orgSrc;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getOrgLink() {
		return orgLink;
	}
	public void setOrgLink(String orgLink) {
		this.orgLink = orgLink;
	}
	public Integer getOrgOrder() {
		return orgOrder;
	}
	public void setOrgOrder(Integer orgOrder) {
		this.orgOrder = orgOrder;
	}
	public Integer getOrgSetTop() {
		return orgSetTop;
	}
	public void setOrgSetTop(Integer orgSetTop) {
		this.orgSetTop = orgSetTop;
	}
	public Integer getOrgType() {
		return orgType;
	}
	public void setOrgType(Integer orgType) {
		this.orgType = orgType;
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
		return "Organization [orgId=" + orgId + ", orgName=" + orgName + ", orgSrc=" + orgSrc
				+ ", orgLink=" + orgLink + ", orgOrder=" + orgOrder + ", orgSetTop=" + orgSetTop + ", orgType="
				+ orgType  + "]";
	}
	
}
