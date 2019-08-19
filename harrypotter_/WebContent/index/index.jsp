<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
   	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
   	<script src="https://use.fontawesome.com/cb4a3bdebe.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
  <style>



    body{
      background:#333333;
    }
    </style>
</head>
<body>

  <div>
        <div style="top:0; left:0; width:100%; height:100%;">
    <img src="img/hog.jpg" width="100%" height="100%">
    </div>
    <div style="position:absolute;top:40%;width:100%;height:100%;text-align:center;padding-top:50;">

    <a  href="main.jsp"><img src="img/potter.png" alt="harry potter" ></a>

    </div>


<div style="position:absolute;width:100%;margin-top:18px;padding-bottom:18px;">
  <center><span style="color:white;">━━━━&nbsp; FIND US ON&nbsp; ━━━━</span></center><br>
<center>
  <a href="#"><span style="color:white;" class="fa fa-twitter fa-2x"></span></a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><span style="color:white;" class="fa fa-facebook-official fa-2x" ></span></a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><span style="color:white;" class="fa fa-instagram fa-2x"></span></a>
</center>
  <br><center><span style="color:white;">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</span>
<br><br><br>
  <div>
    <form name="검색" method="get" action="m_search_list.jsp">
      <input type="text" name="name" size="24"> &nbsp;&nbsp;
       <select name="type" id="type">
	<option value="atd" selected>공격&방어</option>
	<option value="life">실생활</option>
	<option value="dark">어둠</option>
	</select> &nbsp;&nbsp;
     <input type="submit" value="검색">

    </form>
  </div>
  <br><br>
<div>
<span style="color:white;font-size:10px;"> CREATED BY &nbsp; ┃ &nbsp;&nbsp; JI HAE IN , NA YOUNG JUNG , SO YEON KIM , SU SIE HAN</span>

</div>
  </center>

</div>

</div>







</body>
</html>