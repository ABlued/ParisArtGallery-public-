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
<%@ include file="../dbconn.jsp"%>
<script>
	let imagesData = [];

</script>
</head>
<body>
	<%
	String myName = (String) session.getAttribute("myName");
%>

	<script>
		var name = "<%=myName %>";
		if(name == "null"){
			console.log(name);
			alert("잘못된 접근입니다.");
			location.href="../home/index.jsp";
		}
	</script>
	<%
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		ResultSet rs = null;
		Statement stmt = null;
		%>
		<script>
		var patt = new RegExp('<%=search%>');
		</script>
	<%
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
		if(patt.test('<%=title%>')){
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
	}
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

		<nav id="relative" class="navbar navbar-expand-lg navbar-light"
			style="background-color: #E0EAFC;">
			<a class="navbar-brand" href="home.html"><img src="../logo.jpg"
				width="120px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="Sucessindex.jsp">Home <span class="sr-only">(current)</span></a>
					<a class="nav-link" href="http://localhost:8079/JSP/LogoutProcess">sign
						out</a> <a class="nav-link" href="../upload/upload.jsp">upload</a> <a
						class="nav-link" href="../support/SucessSupport.jsp"
						tabindex="-1" aria-disabled="true">Support</a>
						<a class="nav-link" href="#" tabindex="-1" aria-disabled="false">${myName}님</a>
				</div>
			</div>
		</nav>
		<form action="SucessSearchTag.jsp" method="post">
			<div class="searchDiv" class="input-group mb-3" >
				<input type="text" class="form-control" placeholder="태그로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="search">
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">search</button>
			  </div>
		</form>
		<form action="SucessSearchTitle.jsp" method="post">
			<div class="searchDiv" class="input-group mb-3" >
				<input type="text" class="form-control" placeholder="제목으로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="search">
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">search</button>
			  </div>
		</form>


		<div class="images">
		</div>
	</div>
<script src="index.js"></script>

</body>
</html>