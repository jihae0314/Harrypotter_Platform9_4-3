<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 

	Connection conn=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	String jdbc_driver ="com.mysql.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost/jspdb";
      try { 
    	  Class.forName(jdbc_driver);
    		conn=DriverManager.getConnection(jdbc_url,"root","0221"); 		
           //데이터 입력받아서 sql에 넣기 
           
           String sql="UPDATE love1 SET Lovecount=" +request.getParameter("name")+ " where Love_no = "+request.getParameter("lono"); 
           pstmt=conn.prepareStatement(sql);
         	pstmt.executeUpdate();         

         	pstmt.close();
         	conn.close();
       } catch (Exception e) { 
                   System.out.println(e);	
       } 

%> 



</body>
</html>