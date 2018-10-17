package com.flf.entity;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class Student {
	/**
	 * 学生类
	 * id(序号) studentname(学生姓名) studentsex(学生性别  0代表男 1代表女) studentid(学生身份证号) studentno(学生学号) studentclass(班级) addtime(添加时间) updatetime(修改时间)
	 * 
	 */
	private Integer id;//序号
	private String studentName;//学生姓名
	private String studentImage;//学生头像(路径)
	private MultipartFile file;//头像文件
	private Integer studentSex;//学生性别  0代表男 1代表女
	private Integer studentAge;//学生年龄
	private String studentId;//学生身份证号
	private String studentNo;//学生学号
	private String studentClass;//班级
	private Date changeTime;//更新时间
	private Date timeStartForSearch;//时间范围 开始 用于前端查询
	private Date timeEndForSearch;//时间范围 结束 用于前端查询
	private Page page;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentname) {
		this.studentName = studentname;
	}

	public String getStudentImage() {
		return studentImage;
	}
	public void setStudentImage(String studentImage) {
		this.studentImage = studentImage;
	}
	public Integer getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(Integer studentSex) {
		this.studentSex = studentSex;
	}
	public Integer getStudentAge() {
		return studentAge;
	}
	public void setStudentAge(Integer studentAge) {
		this.studentAge = studentAge;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentClass() {
		return studentClass;
	}
	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}

	public Date getChangeTime() {
		return changeTime;
	}
	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public Date getTimeStartForSearch() {
		return timeStartForSearch;
	}
	public void setTimeStartForSearch(Date timeStartForSearch) {
		this.timeStartForSearch = timeStartForSearch;
	}
	public Date getTimeEndForSearch() {
		return timeEndForSearch;
	}
	public void setTimeEndForSearch(Date timeEndForSearch) {
		this.timeEndForSearch = timeEndForSearch;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
}
