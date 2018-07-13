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
import javax.servlet.http.HttpSession;

import modle.SqlOperator;
import modle.Student;
import modle.itClass;
/**
 * Servlet implementation class AllServlet
 */
@WebServlet("/join")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinServlet() {
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
		Statement state2=null;
		Statement state3=null;
		String cid=request.getParameter("cid");
		String id=request.getParameter("id");
		ArrayList<itClass> array=new ArrayList();
		
		try {
			state=con.con.createStatement();
			state2=con.con.createStatement();
			state3=con.con.createStatement();
			String sql="select cid from class";
			String sql2="select * from class_std where id='"+id+"'and cid='"+cid+"'";
			String sql3="select * from class_std natural join class where id='"+id+"'";
            ResultSet rs=state.executeQuery(sql);
            ResultSet rs2=state2.executeQuery(sql2);
            
            int i=3;
			while(rs.next())
			{
				if(cid.equals(rs.getString("cid")))
				{
					
					if(rs2.next())
					{
						i=1;
						PrintWriter out = response.getWriter();
						System.out.println("<script>alert('你已经加入过课'); window.location='index.jsp' </script>");
						out.print("<script>alert('you have joined in! Do not join again!');window.location='success.jsp'</script>");
						out.flush();
						out.close();
					}
					else
					{
						i=2;
					sql="insert into class_std values('"+cid+"','"+id+"')";
					state.execute(sql);
					ResultSet rs3=state3.executeQuery(sql3);
					while(rs3.next())
					{
						itClass itclass=new itClass(rs3.getString("cid"),rs3.getString("tname"),rs3.getString("cname"),rs3.getString("des"),rs3.getString("homework"));
						array.add(itclass);
					}
					HttpSession session=request.getSession();
					session.setAttribute("class", array);
					PrintWriter out = response.getWriter();
					System.out.println("<script>alert('加入课堂成功'); window.location='index.jsp' </script>");
					out.print("<script>alert('successfully!');window.location='success.jsp'</script>");
					out.flush();
					out.close();
					}
				}
			}
			if(i==3)
			{
			PrintWriter out = response.getWriter();
			System.out.println("<script>alert('无该课程号'); window.location='success.jsp' </script>");
			out.print("<script>alert('error class number!');window.location='success.jsp'</script>");
			out.flush();
			out.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}