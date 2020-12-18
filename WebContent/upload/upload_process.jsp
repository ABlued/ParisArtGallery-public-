<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import= "com.oreilly.servlet.multipart.*" %>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:useBean id="numberindex" class="priNumberIndex.priNumberIndex" scope="application"/>
   <%@ include file="../dbconn.jsp" %>
   <% 

   request.setCharacterEncoding("utf-8");
   String myName = (String) session.getAttribute("myName");		//작성자 이름(현재 로그인한 사람의 id값)
   String realSaveDir="C:/Users/ABlue/eclipse-workspace/JSP/WebContent/image";	//사진을 저장할 물리적인 주소
   
   MultipartRequest multi=new MultipartRequest(request,realSaveDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
   String title=multi.getParameter("title");
   String tag=multi.getParameter("tag");
   String comment=multi.getParameter("comment");
   String filename=multi.getFilesystemName("filename");
   String path="../image/" + filename;		//image테이블 path 필드에 들어갈 주소


   
   Statement stmt = null;   
   try{
      SimpleDateFormat currentTime = new SimpleDateFormat("yyyy-MM-dd");		//저장하고 싶은 기간을 yyyy-mm-dd로 만든 후
      Date time = new Date();		//현재 년월일 을 받아낸다
      String dateMade = currentTime.format(time);		//받아낸 정보를 테이블에 입력하기 좋은 타입으로 변환
      
      String sql= "INSERT INTO image(priNumber, id, path, title,dateMade,tag,comment) VALUES(" + numberindex.getIndex() + ",'" + myName + "' , '" + path + "','" + title + "','" + dateMade + "','" + tag + "','" + comment + "')";
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      numberindex.setIndex((numberindex.getIndex()) + 1);
   
   }catch (SQLException ex){
      out.println("Member 테이블 삽입이 실패했습니다.<br>");
      out.println("SQLException: " + ex.getMessage());
      %>
     <script>
       alert("데이터 입력실패");
         
         //location.href="upload.jsp";
      </script> 
   <%
   } finally{
      if(stmt != null) stmt.close();
      if(conn != null) conn.close();
   %>
   <script>
      //alert("데이터 입력성공");
      location.href="../home/Sucessindex.jsp";
   </script>
   <%   
      }
   %>

</body>
</html>