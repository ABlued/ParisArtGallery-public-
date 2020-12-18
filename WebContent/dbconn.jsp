<%@page import="org.apache.taglibs.standard.tag.el.sql.SetDataSourceTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<% 
 		Connection conn = null;
	
		String url = "jdbc:mysql://localhost:3305/JSPBookDB";
 		String user = "root";
 		String password = "비밀!";
		
		Class.forName("com.mysql.jdbc.Driver");
 		conn = DriverManager.getConnection(url, user, password);
	%> 

</body>
</html>