package harrypotter.index;

import java.sql.*;
import java.util.*;
public class Bean {
	

	
	
Connection conn=null;
PreparedStatement pstmt =null;


String jdbc_driver ="com.mysql.jdbc.Driver";
String jdbc_url="jdbc:mysql://localhost:3306/jspdb";

void connect() {
	try {
		Class.forName(jdbc_driver);
		conn=DriverManager.getConnection(jdbc_url,"root","0221");
	}catch(Exception e) {
		e.printStackTrace();
	}
}

void disconnect() {
	if (pstmt !=null) {
		try {
		pstmt.close();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	if(conn!=null) {
		try {
			conn.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
	}
}
}

public ArrayList<book> getDBList(){
	connect();
	ArrayList<book>datas=new ArrayList<book>;
	String sql ="select * from jdbc_test";
	try {
		pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			book book =new book();
			
			book.setMagic_ip(rs.getInt("magic_ip"));
			book.setHname(rs.getString("hname"));
			book.setEname(rs.getString("ename"));
			book.setMeaning(rs.getString("meaning"));
			book.setReadcount(rs.getInt("readcount"));
			book.setType(rs.getString("type"));
			datas.add(book);
		}
		rs.close();
	}catch(SQLException e) {
		e.printStackTrace();
	}
	finally {
		disconnect();
	}
	return datas;
	}
}
