<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 검색 화면</title>
</head>
<body>
    <form action="m_search_list.jsp" method="post">
  
	주문 이름 : <input type="text" name="name"><br><br>
	<select name="type" id="type">
	<option value="atd" selected>공격&방어</option>
	<option value="life">실생활</option>
	<option value="dark">어둠</option>
	</select>
	<input type="submit" value ="검색버튼"> 
	
</form>
</body>
</html>
