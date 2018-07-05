package com.oc.jdbc.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionClass {
	public static void main(String[] args)throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/test";
		
		String user = "root";
		
		String password = "123456";
		
		
		Connection conn = DriverManager.getConnection(url,user,password);
		System.out.println(conn);
	}

}
