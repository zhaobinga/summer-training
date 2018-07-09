package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modle.SqlOperator;
import modle.Student;
/**
 * Servlet implementation class AllServlet
 */
@WebServlet("/Modify")
public class ModifyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlOperator con=new SqlOperator();
		Statement state=null;
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String sex=request.getParameter("sex");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		String des=request.getParameter("des");
		try {
			state=con.con.createStatement();
			String sql="update user set username='"+name+"' where id='"+id+"'";
			String sql2="update info set sex='"+sex+"',email='"+email+"',telephone='"+tel+"',description='"+des+"'";
			System.out.println(sql);
			System.out.println(sql2);
			state.execute(sql);
			state.execute(sql2);
			request.setAttribute("name", name);
			request.setAttribute("Id", id);
			request.setAttribute("email",email);
			request.setAttribute("tel", tel);
			request.setAttribute("sex", sex);
			request.setAttribute("des", des);
			this.getServletContext().getRequestDispatcher("/log/success.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
