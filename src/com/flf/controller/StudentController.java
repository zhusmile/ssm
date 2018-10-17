package com.flf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.flf.entity.Student;

import com.flf.service.StudentService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@RequestMapping
	/**
	 * 显示学生列表
	 * @return
	 */
	public ModelAndView getPage(Student student) {
		System.out.println(student.getTimeEndForSearch());
		System.out.println(student.getTimeStartForSearch());
		List<Student> studentList=studentService.listPageStudent(student);
		ModelAndView mView=new ModelAndView();
		mView.setViewName("students");
		mView.addObject("studentList",studentList);
		mView.addObject("student",student);
//		System.out.println("STUDENTPAGE"+student.getPage().getPageStr());
		return mView;
	}
	/**
	 * 请求添加学生页面
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public String toAdd(Model model) {
		return "student_info";
	}
	/**
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView toEdit(@RequestParam int id){
		ModelAndView mv = new ModelAndView();
		Student student = studentService.getStudentById(id);
		mv.addObject("student", student);
		mv.setViewName("student_info");
		return mv;
	} 
	/**
	 * 删除某个用户
	 * @param userId
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteUser(@RequestParam int id,PrintWriter out){
		studentService.deleteStudent(id);
		out.write("success");
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**
	 * 保存用户信息
	 * @param user
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveStudent(Student student,@RequestParam Integer idKey) throws IllegalStateException, IOException{
		System.out.println("111111");
		System.out.println(student.getStudentName());
		System.out.println(idKey);
		ModelAndView mv = new ModelAndView();
	      //保存数据库的路径  
	      String sqlPath = null;   
	      //定义文件保存的本地路径  
	      String localPath="E:\\eclipse-workspace\\ssm\\WebRoot\\uploadFiles\\uploadImgs\\";
	      System.out.println(localPath);
	      //定义 文件名  
	      String filename=null;    
	      if(!student.getFile().isEmpty()){    
	          //生成uuid作为文件名称    
	          String uuid = UUID.randomUUID().toString().replaceAll("-","");    
	          //获得文件类型（可以判断如果不是图片，禁止上传）    
	          String contentType=student.getFile().getContentType();    
	          //获得文件后缀名   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //得到 文件名  
	          filename=uuid+"."+suffixName;   
	          System.out.println(filename); 
	  	      //把图片的相对路径保存至数据库  
	  	      sqlPath = "/uploadImgs/"+filename;  
	  	      System.out.println(sqlPath);
	  	      student.setStudentImage(sqlPath);
	      }  
	    System.out.println("save");
		
		student.setId(idKey);
		student.setChangeTime(new Date());
//		System.out.println(student.getId());
		if(student.getId()==null || student.getId().intValue()==0){
			if(studentService.insertStudent(student)==false){
				System.out.println("insert");
				mv.addObject("msg","failed");
			}else{
				mv.addObject("msg","success");
				if(!student.getFile().isEmpty()) {
					student.getFile().transferTo(new File(localPath+filename));  
				}
			}
		}else{
			System.out.println("update");
			studentService.updateStudent(student);
			if(!student.getFile().isEmpty()) {
				student.getFile().transferTo(new File(localPath+filename));  
			}  
		}
		mv.setViewName("save_result");
		return mv;
	}
//	

}
