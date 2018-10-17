package com.flf.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


//创业群体
public class EntreGroup {
	private Integer egId;//id 对应表的主键 eg_id
	private String egName;//名称 对应 字段 eg_name
	private String egIssuer;//添加人 对应 字段 eg_issuer
	private Date egAddTime;//添加时间 对应字段 eg_addTime
	private String egModifier;//修改人 对应字段 eg_modifier
	private Date egChangeTime;//修改时间 对应字段 eg_changeTime
	private Integer egOrder;//排序 对应字段eg_order
	private Integer egSetTop;//置顶 对应字段 eg_setTop
	private MultipartFile file;//对应前端文件上传
	private String egSrc;//保存上传文件的存储路径
	private Page page;
	public Integer getEgId() {
		return egId;
	}
	public void setEgId(Integer egId) {
		this.egId = egId;
	}
	public String getEgName() {
		return egName;
	}
	public void setEgName(String egName) {
		this.egName = egName;
	}
	public String getEgIssuer() {
		return egIssuer;
	}
	public void setEgIssuer(String egIssuer) {
		this.egIssuer = egIssuer;
	}
	public Date getEgAddTime() {
		return egAddTime;
	}
	public void setEgAddTime(Date egAddTime) {
		this.egAddTime = egAddTime;
	}
	public String getEgModifier() {
		return egModifier;
	}
	public void setEgModifier(String egModifier) {
		this.egModifier = egModifier;
	}
	public Date getEgChangeTime() {
		return egChangeTime;
	}
	public void setEgChangeTime(Date egChangeTime) {
		this.egChangeTime = egChangeTime;
	}
	public Integer getEgOrder() {
		return egOrder;
	}
	public void setEgOrder(Integer egOrder) {
		this.egOrder = egOrder;
	}
	public Integer getEgSetTop() {
		return egSetTop;
	}
	public void setEgSetTop(Integer egSetTop) {
		this.egSetTop = egSetTop;
	}
	public Page getPage() {
		if(page==null) {
			 page = new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getEgSrc() {
		return egSrc;
	}
	public void setEgSrc(String egSrc) {
		this.egSrc = egSrc;
	}
	@Override
	public String toString() {
		return "EntreGroup [egId=" + egId + ", egName=" + egName + ", egIssuer=" + egIssuer + ", egAddTime=" + egAddTime
				+ ", egModifier=" + egModifier + ", egChangeTime=" + egChangeTime + ", egOrder=" + egOrder
				+ ", egSetTop=" + egSetTop + ", file=" + file + ", egSrc=" + egSrc + ", page=" + page + "]";
	}
	
	
}
