package com.oc.code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收请求参数
		String code= request.getParameter("code");
		System.out.println(code);
		
		byte[] bytes = code.getBytes("ISO8859-1");
		code = new String(bytes,"UTF-8");
		System.out.println(code);
		
		//取出存放的word
		String word = (String)this.getServletContext().getAttribute("checkCode");
		
		//设置字符集
		response.setContentType("text/html;charset=UTF-8");
		
		//对比
		if(code.equals(word)){
			response.getWriter().write("<script>alert(\"注册成功\");</script>");
			response.setHeader("refresh", "3;url=/onlineClass/html/index.html");
		}
		else{
			response.getWriter().write("<script>alert(\"验证码错误\");</script>");
			response.setHeader("refresh", "3;url=/onlineClass/html/index.html");
		}
	
	}

}
