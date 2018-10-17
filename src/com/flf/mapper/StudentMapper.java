package com.flf.mapper;


import java.util.List;

import com.flf.entity.Student;

public interface StudentMapper {
	//通过id获取学生信息
	Student getStudentById(Integer id);
	//获取所有学生
	List<Student> listAllStudent();
	//添加学生
	void insertStudent(Student student);
	//查询学生
	List<Student> listPageStudent(Student student);
	//更新学生信息
	void updateStudentInfo(Student student);
	//删除学生信息
	void deleteStudent(Integer id);
	//根据学号查找信息
	int getStudentByNo(String no);
}
