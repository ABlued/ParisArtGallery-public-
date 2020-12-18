<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>로그인</title>
<link rel="stylesheet" href="../background.css?after">
<link rel="stylesheet" href="login.css?after">
</head>
<body>

	<div id="background">
		<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
			crossorigin="anonymous"></script>

		<nav class="navbar navbar-expand-lg navbar-light"
			style="background-color: #E0EAFC;">
			<a class="navbar-brand" href="index.html"><img src="../logo.jpg"
				width="120px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="../home/index.jsp">Home <span
						class="sr-only">(current)</span></a> <a class="nav-link active"
						href="#">sign in</a> <a class="nav-link" href="../join/join.jsp">join</a>
					<a class="nav-link" href="../support/support.html" tabindex="-1"
						aria-disabled="true">Support</a>
				</div>
			</div>
		</nav>

		<script type="text/javascript">
			function checkLoginForm() {
				var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				var regExpPasswd = /^[0-9]*$/;

				var form = document.loginForm;
				var id = form.id.value;
				var passwd = form.passwd.value;


				if (id == "") {
					alert("아이디를 입력해주세요.");
					form.id.select();
					return ;
				}
				else if (!regExpId.test(id)) {
					alert("아이디는 문자로 시작해주세요");
					form.id.select();
					return ;
				}
				else if (passwd == "") {
					alert("비밀번호를 입력해주세요.");
					form.passwd.select();
					return ;
				}
				else if (!regExpPasswd.test(passwd)) {
					alert("비밀번호는 숫자만 입력가능합니다.");
					form.passwd.select();
					return ;
				}
				else form.submit();
			}
		</script>



		<form id="container" action="login_process.jsp" method="post" name="loginForm" onsubmit="return false">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"
						style="padding-right: 28px;">아이디</span>
				</div>
				<input type="text" class="form-control" name="id" placeholder="id" aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="password" class="form-control" name="passwd" placeholder="password" aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div id="center">
				<button onclick="checkLoginForm()" type="hidden" style="margin-right: 10px;"
					class="btn btn-outline-primary">로그인</button>
				<a href="../join/join.jsp"><button type="button"
						class="btn btn-outline-primary">회원가입</button></a>
			</div>
		</form>


	</div>

</body>
</html>