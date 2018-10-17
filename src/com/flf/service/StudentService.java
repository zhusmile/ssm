package com.flf.service;

import java.util.List;

import com.flf.entity.Student;

public interface StudentService {
	Student getStudentById(Integer id);
	List<Student> listAllStudent();
	boolean insertStudent(Student student);
	void updateStudent(Student student);
	List<Student> listPageStudent(Student student);
	void deleteStudent(Integer id);
}
