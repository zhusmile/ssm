package com.flf.entity;


import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

//用于生成上传文件的存储名和路径
public class SavePath {
	 //保存数据库的路径  
    private String sqlPath = "/uploadImgs/";   
    //定义文件保存的本地路径  
    private String localPath="E:\\eclipse-workspace\\ssm\\WebRoot\\uploadFiles\\uploadImgs\\";
    public String getFileName(MultipartFile file) {
    		//定义 文件名  
        	String filename=null;
           	//生成uuid作为文件名称    
            String uuid = UUID.randomUUID().toString().replaceAll("-","");    
            //获得文件类型（可以判断如果不是图片，禁止上传）    
            String contentType=file.getContentType();    
            //获得文件后缀名   
            String suffixName=contentType.substring(contentType.indexOf("/")+1);  
            //得到 文件名  
            filename=uuid+"."+suffixName;   
            System.out.println(filename);
    	     return filename;
	}
	public String getSqlPath() {
		return sqlPath;
	}
	public void setSqlPath(String sqlPath) {
		this.sqlPath = sqlPath;
	}
	public String getLocalPath() {
		return localPath;
	}
	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
    
}
