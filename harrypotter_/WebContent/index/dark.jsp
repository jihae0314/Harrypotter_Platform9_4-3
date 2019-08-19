<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("EUC-KR"); %>
   
  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
   	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
   	<script src="https://use.fontawesome.com/cb4a3bdebe.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
<title> 해리포터 </title>

<script>

$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})


</script>
      <style>

.a{

  border:1px solid #ccc;
}

.item-wrapper {
      overflow: hidden;
      width: 100%;
}
.item-wrapper:after {
      content: ""; clear: both; display: block;
}

.item-container {
      width: 400px;
      float: left;
      margin-right: 20px;
}

.item-box {
      padding: 50px 50px 25px 50px;
      border: 1px solid #ccc;
}

.item-table {
      width: 300px;
}

.thumb-wrapper {
      position: relative;
      width: 300px;
      height: 120px;
}



.item-new {
      position: absolute;
      top: -5px;
      left: 15px;
      width: 30px;
      height: 40px;
      background: url('img/new.png');
      z-index: 100;
}

.thumb-on {
      position: absolute;
      width: 100%;
      height: 100%;
      z-index: 99;
}

.thumb-on a {
      display: block;
      width: 100%;
      height: 100%;
}

.thumb {
      background: url('img/bg_0per.png') no-repeat;
}
.thumb:hover {
      background: url('img/md.png') no-repeat;
}

.item-title {
      overflow: hidden;
      width: 300px;
      white-space: nowrap;
      text-overflow: ellipsis;
}

.item-title h2 {
      padding: 30px 0;
      font-size: 10px;
      text-align: center;

}

.item-title h2 a{
  color: black;
}

.item-info {
      padding-top: 25px;
      border-top: 1px solid #ccc;
      color: #888;
}
.item-info:after {
      content: ""; clear: both; display: block;
}

.item-category {
      width: 30px;
      height: 13px;
}

#photo{
      background: url('img/bg_item_info1.png') 0 50% no-repeat;
}
#video {
      background: url('img/bg_item_info2.png') 0 50% no-repeat;
}
#cate-secret1 {
      background: url('img/bg_item_info3.png') 0 50% no-repeat;
}
#cate-secret2 {
      background: url('img/bg_item_info5.png') 0 50% no-repeat;
}
#b-cut {
      background: url('img/bg_item_info4.png') 0 50% no-repeat;
}

#hit-comment {
      width: 270px;
      text-align: right;
}

.item-hit {
      display: inline-block;
      width: 90px;
      height: 13px;
      line-height: 13px;
      padding-left: 26px;
      background: url('img/bg_item_info1.png') -190px 50% no-repeat;
      text-align: left;
}

.item-comment {
      display: inline-block;
      width: 20px;
      height: 13px;
      line-height: 13px;
      text-align: left;
}

.item-bottom {
      height: 150px;
}

.rh{
  width: 80%;
  height: 100%;
  margin-top:60px;
    margin-left: auto;
    margin-right: auto;}



.SubNavi {
    width: 100%;
    height: 112px;
    text-align: center;
    background-color:#5c5c5c;
}
.SubNavi > a{margin-right:90px;
}

.SubTitle {
    width: 100%;
    height: 233px;
    text-align: center;
    background-color:#5c5c5c;
}
.sub-content {
    width: 1275px;
    margin: 100px auto 150px auto;
}
      </style>
  </head>
 <body onload="document.body.scrollTop=document.cookie" onunload="document.cookie=document.body.scrollTop">
  
  
  <%Connection conn=null;
  PreparedStatement pstmt =null;
  ResultSet rs=null;
  String jdbc_driver ="com.mysql.jdbc.Driver";
  String jdbc_url="jdbc:mysql://localhost/jspdb";
  String list1= request.getParameter("list1")==null ? "" : request.getParameter("list1");
  String sqlorder=null;

  
  
  try {
  		Class.forName(jdbc_driver);
  		conn=DriverManager.getConnection(jdbc_url,"root","0221");
  		
  			switch(list1){
  	  		case "alphabet":
  	  			sqlorder="Ename";	
  	  			break;
  	  		case "inquiry":
  	  			sqlorder="Readcount desc";	
  	  			break;
  	  		case "population":
  	  			sqlorder= "Lovecount desc";
  	  			break;
  	  		case "":
	  			sqlorder="Ename";	
	  			break;
	  		
  		
  		}
  		
  		String sql="select * from dark inner join img3 on img3.img_no=dark.magic_ip inner join love3 on love3.love_no=img3.img_no order by " + sqlorder;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
 %>
 
<div>

<div class="SubTitle">
<a href="index.jsp"><img src="img/spell.png" border="0"></a>
</div>
  <div class="SubNavi">
<a href="main.jsp"><img src="img/attack.png" border="0"></a>
<a href="pragmatic.jsp"><img src="img/silyong.png" border="0"></a>
<span><a href="dark.jsp"><img src="img/dark.png" border="0"></a></span>
</div>


<table class="sub-content" align="center">
<tbody>
    <tr>
      <td>
      <div style="float: right;  margin-bottom:50px;">
<form action="dark.jsp">
<select name="list1" id="list1">
<option value="alphabet">알파벳순</option>
<option value="inquiry">조회순</option>
<option value="population">인기순</option>
</select>
<input type="submit" name="page" value="선택" />
</form>
</div>
			<!-- 게시판 start -->
<div class="board-wrapper">
<!-- 리스트 start -->
  
<div style="display: none;">
 <form method="post" name="list" action="darkmodal.jsp">
  
  <input type="hidden" name="id" value="data" />
  <input type="hidden" name="lono" value="data" />
 </form>
<!-- 
<input type="hidden" name="page" value="1" />
 <input type="hidden" name="select_arrange" value="headnum" />
  <input type="hidden" name="desc" value="asc" />
  <input type="hidden" name="page_num" value="6" />
  <input type="hidden" name="selected" />
  <input type="hidden" name="exec" />
  <input type="hidden" name="keyword" value="" />
  <input type="hidden" name="sn" value="off" />
  <input type="hidden" name="ss" value="on" />
  <input type="hidden" name="sc" value="on" />-->
</div>



<div class="item-wrapper"> 
<%
  	while(rs.next()){ 
		
		
  %>
  <div class="item-container">
  
   
  
  <div class="item-box">
    <table class="item-table">
  
      <tr>
        <td colspan="2">
          <div class="thumb-wrapper" style="background: url('img/spell/dark/<%=rs.getString("img_src") %>.<%=rs.getString("img_file") %>') no-repeat; background-size:100% 100%; ">
                        <div class="thumb-on"><a href='darkmodal.jsp?id=<%=rs.getString("Ename") %>&lono=<%=rs.getInt("Love_no") %>'  data-toggle="modal" data-target="#myModal" class="thumb"></a></div>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2">
        
          <div class="item-title"><h2><a href='darkmodal.jsp?id=<%=rs.getString("Ename") %>&lono=<%=rs.getInt("Love_no") %>'  data-toggle="modal" data-target="#myModal">  <%=rs.getString("Ename") %>   </a></h2></div>
       

         
          
     
          
          
        </td>      
      </tr>
      <tr>
        <td class="item-info">
          <div class="item-category" id="photo"></div>        </td>
        <td class="item-info" id="hit-comment">
       
          <span class="item-hit"><%=rs.getString("Readcount") %></span>
          <span class="item-comment"><%=rs.getString("Lovecount") %></span>
        </td>
      </tr>

    </table>
  </div>
  <div class="item-bottom">&nbsp;</div>
 
</div>

<% 
 	
	}    
%>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          
      <div class="modal-dialog">
        <div class="modal-content">
          
          
          
        </div>
      </div>
    </div>





<% 
	}catch(Exception e){
	 System.out.println(e);

	 } finally {

		  if (rs != null) rs.close();

	       if (pstmt != null) pstmt.close();

	       if (conn != null) conn.close();

	    }

 %>

<!--아이템 컨테이너 닫기-->







</div>  <!-- rh까지 -->





</div>
</td></tr></tbody></table>

</div>



<%@ include file="footer.jsp" %>


  </body>
</html>
