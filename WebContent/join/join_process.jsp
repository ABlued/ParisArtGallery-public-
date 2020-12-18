<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../dbconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Statement stmt = null;
		try{
			String sql= "INSERT INTO Artmember(id, passwd, name) VALUES('" + id + "' , '" + passwd + "','" + name + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
// 			out.println("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex){
// 			out.println("Member 테이블 삽입이 실패했습니다.<br>");
// 			out.println("SQLException: " + ex.getMessage());
			%>
			<script>
				alert("회원가입이 처리되지않았습니다.");
				location.href="join.jsp";
			</script>
		<%
		} finally{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		%>
		<script>
			alert("회원가입이 정상적으로 처리되었습니다.");
			location.href="../home/index.jsp";
		</script>
		<%	
			}
		%>


</body>
</html>