<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="harrypotter.index.*" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="gb" scope="page" class="harrypotter.index.Bean"/>
    <jsp:useBean id="book" class="harrypotter.index.book"/>
    <jsp:setProperty name="book"  property="*"/>
    <% 
    String action=request.getParameter("action");
    if(action.equals("list")){
    }
    else if (action.equals("insert")){
    }
    else if (action.equals("edit")){
    }
    else if (action.equals("update")){
    }
    else if (action.equals("delete")){
    }
    else{
    }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>