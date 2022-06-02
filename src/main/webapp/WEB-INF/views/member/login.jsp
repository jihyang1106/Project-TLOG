<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/login.css" type="text/css">
<!-- 카카오 JavaScript SDK 최신버전 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<main>
	<div class="container">
		<div id="loginContainer">
			<div id="logoContainer">
				<a href="/"><img src="/img/member/logo2.png" id="logo"></a>
			</div>
			<div id="loginInfoContainer">
				<p id="loginTitle">로그인</p>
				<div class="otherLogin">
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=3e06893f3a47571afed7ebd080a8fd24&redirect_uri=http://localhost:8040/member/kakaologin"><img class="kakao-login-img" src="/img/member/kakao_login.png" id="kakaoLogo"></a>
				</div>
				<div class="otherLogin">
					<a href="#"><img src="/img/member/google_login.png"></a>
				</div>
			</div>
		</div>
	</div>
</main>
<script>
document.addEventListener("DOMContentLoaded", function(event){
   document.getElementById('top').style.display = "none";
   document.getElementById('bottom').style.display = "none";
});
</script>