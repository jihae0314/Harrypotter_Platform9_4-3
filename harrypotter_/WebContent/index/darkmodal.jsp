<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 
  Connection conn=null;
  PreparedStatement pstmt =null;
  ResultSet rs=null;
  String jdbc_driver ="com.mysql.jdbc.Driver";
  String jdbc_url="jdbc:mysql://localhost/jspdb";
  String id = request.getParameter("id");
  
  
  
  try {
  		Class.forName(jdbc_driver);
  		conn=DriverManager.getConnection(jdbc_url,"root","0221"); 		
	 String sql="select * from dark inner join img3 on img3.img_no=dark.magic_ip inner join love3 on love_no=img3.img_no where Ename = '"+id +"'";
	 
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
		
  %>
  
   <%while(rs.next()){
        	 

        	 
        	 %>
   
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 

<script type="text/javascript">
var num = "<%=rs.getInt("Lovecount")%>";
var lono="<%=request.getParameter("lono")%>";
$(function(){ 


    $('#id02').on('click',function(){  
              //alert("데이터 전송~ ^^*"); 
       $.ajax({ 
               url:'darklove.jsp', //가져오고자하는 서버페이지 주소를 넣는다. 
               type:'post', //데이터를 서버로 전송하게 된다. 
               data:{ 
                      name: num,  //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
                      lono: lono
               } , 
               success : function(t){ 
                            // alert('성공!');
               } , 
               error : function(){ 
                        // alert('실패 ㅠㅠ'); 
               } 
        });
    }); 
}); 

$(document).ready(function() {



	 putString();


});


function putString() { 
     document.getElementById('numberContainer').innerText = num; 
  } 


function setDisable(elementid) {

num ++; 
 
putString(); 
var el = document.getElementById(elementid);
//alert(el);
el.disabled = 'true';


}


</script>

</head>
<body onload="document.body.scrollTop=document.cookie" onunload="document.cookie=document.body.scrollTop">
 
  
  <div class="modal-header">
  				<form><input type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true" value="&times;" onClick="history.go(0)"></form>
            
            <center><h4 class="modal-title" id="myModalLabel"><%=rs.getString("Ename") %></h4></center>
          </div>
          <div class="modal-body">
          <div style="margin-bottom:30px;">
        <center><img src="img/spell/dark/<%=rs.getString("img_src") %>.<%=rs.getString("img_file") %>" style="width:300px;height:120px;"></center>
        </div>
  		<center>
  		<table>
  		<tr>
  		<td style="padding-right: 20px;"><b>English</b></td>
  		<td><i><%=rs.getString("Ename") %></i></td>
  		</tr>
  		<tr></tr>
  		<tr>
  		<td><b>Korean</b></td>
  		<td style="padding-right: 20px;"><i><%=rs.getString("Hname") %></i></td>
  		</tr>
  		</table>
  		 <br>
  		<%=rs.getString("Meaning") %></center>
  		<br>
<center>
<table  cellspacing='0' cellpadding='0' >
<div id="numberContainer" ></div> 
<div align="center"></div> 
<tr>
<th> 

<input type='button' id='id02' value='♥' style="color:red;" onclick="setDisable('id02')" />

</th>
</tr>
</table>
  		</center>
  		<br>
          </div>
          
          
         
  <%
  int hit = rs.getInt("Readcount");
	hit++;
  sql = "UPDATE dark SET Readcount=" + hit + " where Ename='" +rs.getString("Ename")+"'"; 
  pstmt.executeUpdate(sql);

  
  
 /* sql="select * from ip";
  pstmt=conn.prepareStatement(sql);
  ResultSet rss=pstmt.executeQuery();
  String IP=request.getRemoteAddr();
  if(rss.getString("ip") != IP ){
	  
	  hit++;
	  sql="insert into ip values ('" +IP+"')";
	  pstmt.executeUpdate(sql);
	  sql = "UPDATE jdbc_test SET Readcount=" + hit + " where Ename='" +rs.getString("Ename")+"'"; 
	  pstmt.executeUpdate(sql);
	  
  }*/
  
	}}catch(Exception e){
	 System.out.println(e);

	 }finally {

		  if (rs != null) rs.close();

	       if (pstmt != null) pstmt.close();

	       if (conn != null) conn.close();

	    } %>
</body>
</html>