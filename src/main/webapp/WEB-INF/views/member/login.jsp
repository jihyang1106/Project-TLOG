<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/login.css" type="text/css">
<script type="module" src="/js/member/login.js"></script>
<!-- 카카오 JavaScript SDK 최신버전 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<main>
	<div class="container">
		<div id="loginContainer">
			<div id="logoContainer">
				<a href="/"><img src="/img/logo.png" id="logo"></a>
			</div>
			<div id="loginInfoContainer">
				<p id="loginTitle">로그인</p>
				<div class="otherLogin">
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=a7b1e2d31b1e4b9b211d09f5dcd83a80&redirect_uri=private final String REDIRECT_URI = "http://tlog0609.kro.kr/member/kakaoLogin"><img class="kakao-login-img" src="/img/member/kakao_login.png" id="kakaoLogo"></a>
				</div>
				<div class="otherLogin">
					<a href="#"><img src="/img/member/google_login.png"></a>
				</div>
			</div>
		</div>
	</div>
</main>