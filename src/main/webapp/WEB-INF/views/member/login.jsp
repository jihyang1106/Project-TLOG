<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/login.css" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<main id="loginContainer">
	<div id="logoContainer">
		<img src="/img/member/logo2.png" id="logo">
	</div>
	<div id="loginInfoContainer">
		<p id="loginTitle">로그인</p>
		<div class="otherLogin">
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=8299169b3aa46a93e89d0f3fe4ed0583&redirect_uri=http://localhost:8040/member/kakaologin"><img class="kakao-login-img" src="/img/member/kakao_login.png" id="kakaoLogo"></a>
		</div>
		<div class="otherLogin">
			<a href="#"><img src="/img/member/google_login.png"></a>
		</div>
	</div>
</main>