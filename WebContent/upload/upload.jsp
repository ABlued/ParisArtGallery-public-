<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>Home</title>
<link rel="stylesheet" href="../background.css?after">
<link rel="stylesheet" href="../support/support.css?after">
<link rel="stylesheet" href="index.css?after">
<link rel="stylesheet" href="../login/login.css">

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
<script type="text/javascript">
function checkMember(){
	
	var form = document.fileForm;
	var title = form.title.value;
	var tag = form.tag.value;
	var comment = form.comment.value;
	var filename = form.filename.value;
	
	
	if(title == ""){
		alert("제목을 입력해주세요.");
		form.title.select();
		return 0;
	}
	if(tag == ""){
		alert("태그를 입력해주세요.");
		form.tag.select();
		return 0;
	}
	if(comment == ""){
		alert("코멘트를 입력해주세요.");
		form.comment.select();
		return 0;
	}
	if(filename == ""){
		alert("파일을 업로드해주세요.");
		form.filename.select();
		return 0;
	}

	form.submit();
}

</script>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->


	<div id="noRepeatBackground" style="padding-bottom: 100px">


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
					<a class="nav-link" href="../home/Sucessindex.jsp">Home <span
						class="sr-only">(current)</span></a> <a class="nav-link"
						href="http://localhost:8079/JSP/LogoutProcess">sign out</a> <a
						class="nav-link active" href="#">upload</a> <a class="nav-link"
						href="../support/SucessSupport.jsp" tabindex="-1"
						aria-disabled="true">Support</a>
						<a class="nav-link" href="#" tabindex="-1" aria-disabled="false">${myName}님</a>
				</div>
			</div>
		</nav>




		<form name="fileForm" method="post" enctype="multipart/form-data"
			action="upload_process.jsp" onsubmit="return false">

			<div id="container">

				<p class="image__title" style="text-align: center;">
					작성자 :
					${myName}</p>
				<hr>
				<div class="form-floating mb-3">
					<p for="floatingInput" style="text-align: center;">title</p>
					<input type="text" class="form-control" id="floatingInput" name="title">
				</div>
				<div class="form-floating">
					<p for="floatingInput" style="text-align: center;">tag</p>
					<input type="text" class="form-control" id="floatingPassword" name="tag">
				</div>
				<div class="form-floating">
					<p for="floatingInput" style="text-align: center;">comment</p>
					<textarea class="form-control" id="floatingTextarea2" rows="7"
						cols="50" name="comment"></textarea>
				</div>
				<div class="form-floation">
					<input type="file" class="form-control" id="floatingInput" name="filename" value="">
					<button id="center" class="btn btn-outline-primary"  onclick="checkMember()" type="hidden">Upload</button>
				</div>
				
			</div>
		</form>
	</div>
</body>
</html>