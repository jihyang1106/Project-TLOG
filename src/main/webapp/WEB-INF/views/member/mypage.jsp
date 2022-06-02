<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/mypage.css" type="text/css">
<script src="/js/member/mypage.js"></script>

<div id="mypageContainer">
	<!-- 마이페이지 슬라이드바 -->
	<div id="mypageSlideSection">
		<ul class="nav nav-tabs" id="tab">
			<li class="nav-item" id="tab1"><a class="nav-link active" data-toggle="tab" href="#userEdit">회원정보수정</a></li>		
			<li class="nav-item" id="tab2"><a class="nav-link" data-toggle="tab" href="#myLog">내가쓴 글 보기</a></li>		
			<li class="nav-item" id="tab3"><a class="nav-link" data-toggle="tab" href="#myFollow">팔로우한 사람</a></li>		
		</ul>
	</div>
	<!-- 마이페이지 컨텐츠 -->
	<div id="mypageContent">
		<div id="userEdit"></div>
		<div id="myLog"></div>
		<div id="myFollow"></div>
	</div>
</div>