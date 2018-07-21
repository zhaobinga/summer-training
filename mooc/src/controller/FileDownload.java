package controller;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modle.SqlOperator;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/download")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileDownload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");

		response.setContentType("text/html;charset=utf-8");
		
		int cid=Integer.parseInt(request.getParameter("courseId"));
		System.out.println(cid);
		SqlOperator so = new SqlOperator();
		String sql=String.format("SELECT fileName FROM kejian WHERE cid=%d", cid);
		System.out.println(sql);
		try {
			so.rs=so.stat.executeQuery(sql);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		PrintWriter pw=response.getWriter();
		//System.out.println("执行过这一步");
		pw.write("<html><head><title>课件下载</title></head>");
		pw.write("<body><div align='center'>");
		try {
			while(so.rs.next()) {

				pw.write("<a href='downloadFile?fileName="+so.rs.getString("fileName")+"'>"+so.rs.getString("fileName")+"</a><br>");
			}
		} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
		}
		pw.write("</div></body></html>");

		//request.getRequestDispatcher("stCourse.jsp").forward(request, response);
	}

}
