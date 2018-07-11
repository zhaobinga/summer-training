package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modle.SqlOperator;

/**
 * Servlet implementation class logServlet
 */
@WebServlet("/log")
public class logServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		//获取表单的用户名
				String username=request.getParameter("uName");
				username=new String(username.getBytes("iso-8859-1"),"utf-8");
				//获取表单的密码
				String password=request.getParameter("uPwd");
				String code = request.getParameter("code");
				
				// 验证验证码
				String sessionCode = request.getSession().getAttribute("code").toString();
				SqlOperator so=new SqlOperator();
				ResultSet rs=so.getRS();

				String outcome="/then.jsp";

				if(code.equalsIgnoreCase(sessionCode)) {
					try {
						if(username.equals("")||password.equals("")) {
							request.setAttribute("outcome", "2");
						}else {
							while(rs.next()) {
								if(username.equals(rs.getString("id"))&&password.equals(rs.getString("pwd"))) {
									
									request.setAttribute("name", rs.getString("username"));
									request.setAttribute("Id", rs.getString("id"));
									request.setAttribute("email", rs.getString("email"));
									request.setAttribute("tel", rs.getString("telephone"));
									request.setAttribute("sex", rs.getString("sex"));
									request.setAttribute("des", rs.getString("description"));
									request.setAttribute("psw", rs.getString("pwd"));
									
									outcome="/log/success.jsp";
								}    				
							}if(!outcome.equals("/log/success.jsp"))
								request.setAttribute("outcome", "3");
						}
					} catch (SQLException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}

				}else {
					request.setAttribute("outcome", "1");
				}
				request.getRequestDispatcher(outcome).forward(request, response);
				so.close();
	}

}
