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
	String pass = request.getParameter("passwd");

	ResultSet rs1 = null;
	PreparedStatement pstmt1 = null;

	try {

		String sql = "select passwd,name from artmember where id = ?";
		pstmt1 = conn.prepareStatement(sql);
		pstmt1.setString(1, id);
		rs1 = pstmt1.executeQuery();

		while (rs1.next()) {
			String rPassword = rs1.getString("passwd");

			if (pass.equals(rPassword)) {
			String rName = rs1.getString("name");
			session.setAttribute("myName", rName);
			
	%>
	<script>
		alert(`<%=rName %>`+"님 안녕하세요");
		location.href = "../home/Sucessindex.jsp";
	</script>
	<%
		}
	}
	//해당 아이디가 없는경우
	%>

	<script>
		alert("아이디와 비밀번호를 잘못 입력했습니다.");
		location.href = "login.jsp";
	</script>

	<%
		} catch (SQLException ex) {
	out.println("SQLException = " + ex.getMessage());
	} finally {
	if (rs1 != null)
		rs1.close();

	if (pstmt1 != null)
		pstmt1.close();

	if (conn != null)
		conn.close();
	}
	%>



</body>
</html>