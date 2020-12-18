<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	 <!-- Bootstrap CSS -->
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

	<title>회원 가입</title>
	<link rel="stylesheet" href="../background.css?after">
	<link rel="stylesheet" href="../support/support.css">

</head>
<body>

	<div id="background">
			<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

		<nav id="relative" class="navbar navbar-expand-lg navbar-light" style="background-color: #E0EAFC;">
			<a class="navbar-brand" href="index.html"><img src="../logo.jpg" width="120px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="../home/index.jsp">Home <span class="sr-only">(current)</span></a>
					<a class="nav-link" href="../login/login.jsp">sign in</a>
					<a class="nav-link active" href="#">join</a>
					<a class="nav-link" href="../support/support.html" tabindex="-1" aria-disabled="true">Support</a>
				</div>
			</div>
		</nav>
		
<script type="text/javascript">
function checkMember(){
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName = regExpId;
	var regExpPasswd = /^[0-9]*$/;
	
	var form = document.member;
	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var passwdCheck = form.passwdCheck.value;
	
	
	if(id == ""){
		alert("아이디를 입력해주세요.");
		form.id.select();
		return 0;
	}
	if(passwd == ""){
		alert("비밀번호를 입력해주세요.");
		form.passwd.select();
		return 0;
	}
	if(passwdCheck == ""){
		alert("비밀번호확인을 입력해주세요.");
		form.passwdCheck.select();
		return 0;
	}
	if(name == ""){
		alert("닉네임을 입력해주세요.");
		form.name.select();
		return 0;
	}
	if(passwd != passwdCheck){
		alert("비밀번호와 비밀번호확인이 서로 다릅니다.");
		form.passwdCheck.select();
		return 0;
	}
	
	if(!regExpId.test(id)){
		alert("아이디는 문자로 시작해주세요");
		form.id.select();
		return 0;
	}
	if(!regExpName.test(name)){
		alert("닉네임은 숫자로 시작할 수 없습니다.");
		form.name.select();
		return 0;
	}
	if(!regExpPasswd.test(passwd)){
		alert("비밀번호는 숫자만 입력가능합니다.");
		form.passwd.select();
		return 0;
	}
	form.submit();
}

</script>
		<div id="container">
			<form method="post" action="join_process.jsp" name="member">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
					  <span class="input-group-text" id="basic-addon1" style="padding-right: 60px;">아이디</span>
					</div>
					<input type="text" class="form-control" style="padding-right: 50px" placeholder="문자만 입력이 가능합니다." aria-label="Username" aria-describedby="basic-addon1" name="id">
				  </div>

				  <div class="input-group mb-3">
					<div class="input-group-prepend">
					  <span class="input-group-text" id="basic-addon1" style="padding-right: 44px;">비밀번호</span>
					</div>
					<input type="password" class="form-control" placeholder="숫자만 입력이 가능합니다." aria-label="Username" aria-describedby="basic-addon1" name="passwd">
				  </div>

				  <div class="input-group mb-3">
					<div class="input-group-prepend">
					  <span class="input-group-text" id="basic-addon1">비밀번호확인</span>
					</div>
					<input type="password" class="form-control" placeholder="숫자만 입력이 가능합니다." aria-label="Username" aria-describedby="basic-addon1" name="passwdCheck">
				  </div>

				  <div class="input-group mb-3">
					<div class="input-group-prepend">
					  <span class="input-group-text" id="basic-addon1" style="padding-right: 60px;">닉네임</span>
					</div>
					<input type="text" class="form-control" placeholder="숫자로 시작할 수 없습니다." aria-label="Username" aria-describedby="basic-addon1" name="name">
				  </div>
				<div id="center">
					<input type="button" onclick="checkMember()" style="margin-right: 10px;" class="btn btn-outline-primary" value="가입"></button>
					<button type="reset" class="btn btn-outline-primary">다시쓰기</button>
				</div>


			</form>
		</div>
	</div>


</body>
</html>