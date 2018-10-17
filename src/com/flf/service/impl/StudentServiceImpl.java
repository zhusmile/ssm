package com.flf.service.impl;

import java.util.List;

import com.flf.entity.Student;
import com.flf.mapper.StudentMapper;
import com.flf.service.StudentService;

public class StudentServiceImpl implements StudentService{
	private StudentMapper studentMapper;

	public StudentMapper getStudentMapper() {
		return studentMapper;
	}

	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	@Override
	public boolean insertStudent(Student student) {
		if(studentMapper.getStudentByNo(student.getStudentNo())>0) {
			return false;
		}else {
			studentMapper.insertStudent(student);
			return true;
		}
		
		
	}

	@Override
	public Student getStudentById(Integer id) {
		// TODO Auto-generated method stub
		return studentMapper.getStudentById(id);
	}

	@Override
	public List<Student> listAllStudent() {
		// TODO Auto-generated method stub
		return studentMapper.listAllStudent();
	}

	@Override
	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		studentMapper.updateStudentInfo(student);
	}

	@Override
	public List<Student> listPageStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.listPageStudent(student);
	}

	@Override
	public void deleteStudent(Integer id) {
		// TODO Auto-generated method stub
		studentMapper.deleteStudent(id);
	}
	
}
