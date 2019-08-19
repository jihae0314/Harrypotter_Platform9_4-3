<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../mycss/css3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
<title>검색</title>
<script>

$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})


</script>
</head>
<body>
<div>

<center>
<table width= "50%" >
<tr class="m">
<td >Magic spell(K)</td><td>Magic spell(E)</td><td>method of use</td><td>category</td>
</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	String name = request.getParameter("name");
	System.out.println(name + "<--name");
		
	//01단계 :드라이버 로딩 시작
	Class.forName("com.mysql.jdbc.Driver");
	//01단계 :드라이버 로딩 끝
	//02단계 :DB연결(Connection)시작
	String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb";
	String dbUser = "root";
	String dbPass = "0221";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	String type= request.getParameter("type")==null ? "" : request.getParameter("type");
	String sqlorder=null;
	String love=null;
	String P11=null;
	
	////////
	try{
		
		switch(type){
	  		case "atd":
	  			sqlorder="attackdefense";
	  			love="love1";
	  			P11="main";
	  			break;
	  		case "life":
	  			sqlorder="pragmatic";
	  			love="love2";
	  			P11="pragmatic";
	  			break;
	  		case "dark":
	  			sqlorder= "dark";
	  			love="love3";
	  			P11="dark";
	  			break;
	  		case "":
  			sqlorder="attackdefense";
  			love="love1";
  			P11="main";
  			break;
		}
		
		String sql = "select * from "+sqlorder+" inner join "+love+" on "+love+".love_no=" +sqlorder+".magic_ip where Hname='"+ name + "'";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if (!rs.next()) {

			out.println("해당하는 정보가 없습니다");

			}
		else{

			rs.previous();

			}
		
		while(rs.next()){
			%>
			
			

			
			<tr class= "active">
				<td><%= rs.getString("Hname")%></td>
				<td><%=rs.getString("Ename") %></td>
				<td><%= rs.getString("Meaning")%></td>
				<td><a href="http://localhost:8080/harrypotter/index/<%=P11%>.jsp"><%= rs.getString("Type")%></a></td>
			</tr>
			
			
			

    
</table>
<button type="button" onClick="history.go(-1)">
뒤로가기
</button>

</center>
</div>
 			
			<%
		}
		
		
		rs.close();
		pstmt.close();
		conn.close();
		
	}
	
		
	
	 catch (Exception e){
		System.out.println("데이터베이스연결오류 : "+e.getMessage());
	
	}
	finally {
		
	}
	
%>
</body>
</html>
