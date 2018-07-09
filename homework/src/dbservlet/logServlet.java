package dbservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SqlOperator;

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
		System.out.println("55555");
		//鑾峰彇琛ㄥ崟鐨勭敤鎴峰悕
		String username=request.getParameter("uName");
		//鑾峰彇琛ㄥ崟鐨勫瘑鐮�
		String password=request.getParameter("uPwd");
		String code = request.getParameter("code");
        // 楠岃瘉楠岃瘉鐮�
        String sessionCode = request.getSession().getAttribute("code").toString();
        SqlOperator so=new SqlOperator();
        ResultSet rs=so.getRS();
        
     //   String outcome="/start.jsp";
        
        if(code.equalsIgnoreCase(sessionCode)) {
        	try {
    			while(rs.next()) {
    				if(username.equals(rs.getString("id"))&&password.equals(rs.getString("pwd"))) {
    					request.setAttribute("name",rs.getString("username"));
    					request.getRequestDispatcher("page/success.jsp").forward(request, response);
    				}
    				
    			}
    			
    		} catch (SQLException e) {
    			// TODO 鑷姩鐢熸垚鐨� catch 鍧�
    			e.printStackTrace();
    		}
        	//request.getRequestDispatcher(outcome).forward(request, response);
        }else {
        	//request.setAttribute("", arg1);;
        }
        
		so.close();
	}

}
