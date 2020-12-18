<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../dbconn.jsp"%>
</head>
<body>



    <%
    String myID = (String) session.getAttribute("myName");
    
    ResultSet rs = null;
	PreparedStatement pstmt = null;
	String priNumber;
	String[] index = request.getParameterValues("index");
	int parsedIndex = Integer.parseInt(index[0]);
	try{
		String sql = "select id from image where priNumber = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, parsedIndex);
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(rs.getString("id").equals(myID)){	
				if (rs != null)
					rs.close();
	
				if (pstmt != null)
					pstmt.close();
				sql = "delete from image where priNumber = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, parsedIndex);
				pstmt.executeUpdate();
				%>
				<script>
					alert("삭제가 완료되었습니다.");
				</script>
				<%
			}
			else{
				%>
				<script>
					alert("당신이 업로드한 게시물이 아닙니다.");
				</script>
				<%
			}
		}	
	}
	catch (SQLException ex) {
		out.println("SQLException = " + ex.getMessage());
		} 
	finally {
			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (conn != null)
				conn.close();
			}	
    %>
    <script>
		location.href="Sucessindex.jsp";
    </script>
    


</body>
</html>