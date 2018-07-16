package modle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SqlOperator {

	private String sql;
	//杩炴帴鏁版嵁搴撶殑鐢ㄦ埛鍚�
	private static String user="root";
	//private static String user="nozzn3xlwl";
	//杩炴帴鏁版嵁搴撶殑瀵嗙爜
	private static String pwd="woshi3bwopashei";
	//private static String pwd="0301kw1lm3ihxlwyyxm4kwh1h02k15klzw2myij2";
	private static String url="jdbc:mysql://localhost:3306/shixun?useSSL=false&serverTimezone=UTC&characterEncoding=utf-8";
	//private static String url="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_iterykt";
	//椹卞姩鍚嶅瓧
	private static String driver = "com.mysql.cj.jdbc.Driver";
	//private static String driver ="com.mysql.jdbc.Driver";
	//杩炴帴缁撴灉闆唀tc
	public Connection con;
	public Statement stat;
	public ResultSet rs;

	public void close() {
		try {
			if(con!=null&&!con.isClosed()) {
				con.close();
			}
			if(stat!=null&&!stat.isClosed()) {
				stat.close();
			}
		} catch (SQLException e) {
			// TODO 鑷姩鐢熸垚鐨� catch 鍧�
			e.printStackTrace();
		}
	}
	
	//鍚戞暟鎹簱涓彃鍏ユ暟鎹�
	public int insert(String[] info) {
		
		try {
			sql=String.format("INSERT INTO user VALUES('%s','%s','%s','%s')", info[0],info[1],info[2],info[3]);
			rs=stat.executeQuery(sql);
			return rs.getRow();
		} catch (Exception e) {
			// TODO 鑷姩鐢熸垚鐨� catch 鍧�
			e.printStackTrace();
			return 0;
		}		
	}
	
	//鏌ヨ缁撴灉闆�
	public ResultSet getRS() {
		try {
			sql="SELECT * FROM user natural join info";
			rs=stat.executeQuery(sql);
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public SqlOperator(){
		//System.out.println("杩欐槸so鐨勬瀯閫犲嚱鏁�");
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,pwd);
			if(con!=null)System.out.println("con不是空的");
			stat=con.createStatement();
			//if(stat!=null)System.out.println("鍒濆鍖栦簡stat");
		} catch (ClassNotFoundException e) {
			// TODO 鑷姩鐢熸垚鐨� catch 鍧�
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 鑷姩鐢熸垚鐨� catch 鍧�
			e.printStackTrace();
		}
	}
}
