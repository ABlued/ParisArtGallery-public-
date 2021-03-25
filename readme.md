# ParisArtGallery 프로젝트

##### 안녕하세요 웹뿌링클치킨이 아니라 웹뿌론트엔드가 되고싶은 삐약삐약 주니어치킨개발자 ABlued입니다!

html, css, bootstrap, javascript, JSP, JDBC, mysql로 만든 ParisArtGallery에 대해 소개해드리겠습니다.  
  
프로젝트 개요
---

프로젝트 목적 : JSP(백엔드)를 사용해 CRUD 게시판 홈페이지 만들기  
참여자 : ABlued 외 2명  
사용 언어 및 스택 : HTML, CSS, Bootstrap, JavaScript, java, JSP, JDBC, mysql, SQL    
작업 환경 : VSCode, Eclipse  

주로 쓰인 개념들 
---

+ CSS
    + flex, css Model Box

+ JavaScript
    + DOM, EL식, 로컬저장소 이용하기
  
+ java
    + JDBC로 mysql연동, 서블릿 클래스, 커스텀 및 표준 액션

+ mysql
    + 기본적인 SQL DDL, DCL 다루기
  

시연 영상
---
##### 시연 영상 링크 : https://ablue-1.tistory.com/17

홈페이지 소개
---
  
##### 소개 사진
![소개 사진](https://user-images.githubusercontent.com/53801395/112431757-456dfb80-8d83-11eb-8ac9-49744ad465be.jpg)
  
###### HOME 화면
홈페이지에 업로드 된 사진이 나타나는 화면이다.
![Home화면](https://user-images.githubusercontent.com/53801395/112431759-456dfb80-8d83-11eb-81d8-4b8da7a45093.jpg)
  
###### 로그인 화면
회원가입이 되어있는 회원이 로그인할 때 나타나는 화면이다.
![로그인화면](https://user-images.githubusercontent.com/53801395/112431763-46069200-8d83-11eb-8ec0-ee25c93d721a.jpg)
  
###### 회원가입 화면
회원가입이 되어있지 않은 회원이 회원가입을 할 때 나타나는 화면이다.
![회원가입 화면](https://user-images.githubusercontent.com/53801395/112431767-469f2880-8d83-11eb-80de-b1591aa0b903.jpg)
  
###### 업로드 화면
회원가입이 되어있는 회원이 사진을 업로드 할 때 나타나는 화면이다.
![업로드 화면](https://user-images.githubusercontent.com/53801395/112431748-430ba180-8d83-11eb-84d3-53c44b03f099.jpg)
  
###### 개발자연락처 화면
개발자와 Contact, Support하려고 싶은 사용자를 위해 나타나는 화면이다.
![개발자연락처](https://user-images.githubusercontent.com/53801395/112431768-4737bf00-8d83-11eb-8770-232e4856ee7a.jpg)
  
###### 스토리 보드
웹페이지의 흐름이 이런 식으로 나타난다.
![스토리 보드](https://user-images.githubusercontent.com/53801395/112431752-443cce80-8d83-11eb-843f-a1b6219ddae8.jpg)
  
###### 시스템 설계서
![시스템 설계서](https://user-images.githubusercontent.com/53801395/112431755-44d56500-8d83-11eb-8deb-74ac50cf0a47.jpg)
  

중요 코드 로직
---

##### JDBC로 mysql를 연동하는 로직 
코드 위치 : WebContent->dbconn.jsp 13번째 줄에 위치
```
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
```
  

##### 홈페이지에 DB에 있는 이미지를 출력하는 로직
코드 위치 : WebContent-> Home ->index.jsp 27번째 줄에 위치
```
<%
		ResultSet rs = null;
		Statement stmt = null;

	try {
		String sql = "select * from image";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			int priNumber = rs.getInt("priNumber");
			String id = rs.getString("id");
			String path = rs.getString("path");
			String title = rs.getString("title");
			String dateMade = rs.getString("dateMade");
			String tag = rs.getString("tag");
			String comment = rs.getString("comment");

	%>
	<script defer>
		var RPriNumber = "<%=priNumber%>";
		var RAuthor = "<%=id %>";
		var RPath = "<%=path%>";
		var RTitle = "<%=title%>";
		var RDateMade = "<%=dateMade%>";
		var RTag = "<%=tag%>";
		var RComment = "<%=comment%>";

		var imagesObject = {
			priNumber : RPriNumber,
			author : RAuthor,
			path : RPath,
			title : RTitle,
			dateMade : RDateMade,
			tag : RTag,
			comment : RComment,
		}
		imagesData.push(imagesObject);
	</script>

	<%
		}
	} catch (SQLException ex) {
	out.println("SQLException = " + ex.getMessage());
	} finally {
	%>
	<script>
		const stringImage = JSON.stringify(imagesData);
		localStorage.setItem("images",stringImage);
	</script>
	<%
		if (rs != null)
		rs.close();

	if (stmt != null)
		stmt.close();

	if (conn != null)
		conn.close();
	}
	%>
```
  

##### 사용자가 이미지를 DB에 업로드하는 로직
코드 위치 : WebContent-> upload ->upload_process.jsp 16번째 줄에 위치
```
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
```
느낀 점 및 부족한 점
---

##### 느낀 점
처음으로 백엔드 요소와 함께 홈페이지를 제작하게 되었다. 직접 데이터를 넣어 CRUD게시판을 만들어보니 굉장히 신기하고 재밌었다. 백엔드와 프론트 모두 다뤄보니 여태까지 한 프로젝트 중에 가장 재미있었다. 역시 코딩은 문제가 생기면 그 오류를 찾고 해결하는 과정이 재밌고 자신이 직접 만든 데이터가 이쁘게 나오니 풀스텍이 되볼까 생각도 했었다.

##### 부족한 점
시간이 부족했기 때문에 유지보수가 힘든 구조로 만들게 되었다.. 똑같은 코드를 갖고있는 중복되는 파일들이 많다. 이를 해결할려면 React, Vue를 사용해야하는데 JSP와 JS프레임워크가 연동되는 부분을 찾지 못했다. 그냥 과감히 JSP를 버리는 것이 낫다.