<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	 <!-- Bootstrap CSS -->
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

	<title>Home</title>
	<link rel="stylesheet" href="../background.css?after">
	<link rel="stylesheet" href="../support/support.css?after">
	<link rel="stylesheet" href="index.css">
	<link rel="stylesheet" href="../login/login.css">
<%@ include file="../dbconn.jsp"%>

<script>
	let imagesData = [];

</script>
</head>
<body>

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
	<div id="noRepeatBackground">
			<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

		<nav id="relative" class="navbar navbar-expand-lg navbar-light" style="background-color: #E0EAFC;">
			<a class="navbar-brand" href="home.html"><img src="../logo.jpg" width="120px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
					<a class="nav-link" href="../login/login.jsp">sign in</a>
					<a class="nav-link" href="../join/join.jsp">join</a>
					<a class="nav-link" href="../support/support.html" tabindex="-1" aria-disabled="true">Support</a>
				</div>
			</div>
		</nav>
		<form action="searchTag.jsp" method="post">
			<div class="searchDiv" class="input-group mb-3" >
				<input type="text" class="form-control" placeholder="태그로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="search">
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">search</button>
			  </div>
		</form>
		<form action="searchTitle.jsp" method="post">
			<div class="searchDiv" class="input-group mb-3" >
				<input type="text" class="form-control" placeholder="제목으로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="search">
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">search</button>
			  </div>
		</form>


		<div class="images">
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/1.jpg"> -->
<!-- 				<h1 class="image__title">여름과 가을 사이</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/2.jpg"> -->
<!-- 				<h1 class="image__title">봇대</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/3.jpg"> -->
<!-- 				<h1 class="image__title">햇빛이 나를 바라보다</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/4.jpg"> -->
<!-- 				<h1 class="image__title">꽃 그리고 하얀 집</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/5.jpg"> -->
<!-- 				<h1 class="image__title">곧지 않은 길</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/6.jpg"> -->
<!-- 				<h1 class="image__title">바다</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/7.jpg"> -->
<!-- 				<h1 class="image__title">풀 구름 하늘</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/8.jpg"> -->
<!-- 				<h1 class="image__title">햇빛이 가득 담긴 풀장</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/9.jpg"> -->
<!-- 				<h1 class="image__title">불빛</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
<!-- 			<div class="image"> -->
<!-- 				<img src="../image/10.jpg"> -->
<!-- 				<h1 class="image__title">의자</h1> -->
<!-- 				<span class="image__year">작성일 : 2020.09.09</span> -->
<!-- 				<p class="image_author">작성자 : 파댕이</p> -->
<!-- 				<p class="image__rating">태그 : </p> -->
<!-- 			</div> -->
		</div>
	</div>
<script src="notindex.js"></script>

</body>
</html>