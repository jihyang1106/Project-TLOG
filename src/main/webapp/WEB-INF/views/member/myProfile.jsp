<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/js/member/myProfile.js"></script>
<link rel="stylesheet" href="/css/member/myProfile.css" type="text/css">
<style>
.nav-item{
	padding:0;
}
.nav-link{
	text-align:center;
	color:white;
	background-color:rgba(122, 140, 226, 60%);
	border-top-left-radius:20px !important;
	border-top-right-radius:20px !important;
}
</style>

<div id="myProfileContainer">
	<!-- 프로필 사진, 닉네임, 회원정보 수정 버튼 -->
	<div id="profile">
		<span ><img src="/img/member/default_profile.png" id="profileImg"></span>&emsp;&emsp;&emsp;
		<span id="profileNick">닉네임</span>
		<c:if test="${logstatus==Y}">
			<input type="button" id="userEditBtn" value="회원정보수정" onclick="location.href='/member/userEdit'">
		</c:if>
	</div>
	<div id="followSection">
		<span >게시물 00개</span>
		<span  data-toggle="modal" data-target="#follower">팔로워 00명</span>
		<!-- 팔로워 모달 -->
		<div class="modal" id="follower">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">팔로워</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
			      <ul id="followerList">
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로워1</span>
			      	</li>
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로워2</span>
			      	</li>
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로워3</span>
			      	</li>
			      </ul>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn followerBtn" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<span  data-toggle="modal" data-target="#follow">팔로우 00명</span>
		<!-- 팔로우 모달 -->
		<div class="modal" id="follow">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">팔로우</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
			      <ul id="followerList">
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로우1</span>
			      	</li>
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로우2</span>
			      	</li>
			      	<li>
				      	<span ><img src="/img/member/default_profile.png" id="followerImg"></span>&emsp;
						<span id="followerNick">팔로우3</span>
			      	</li>
			      </ul>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn followerBtn" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<!-- 일기 탭, 태그된글, 찜한 글 탭 -->
	<div id="mypageTabSection">
		<ul class="nav nav-tabs" id="tab">
			<li class="nav-item col-sm-4" id="tab1"><a class="nav-link active" data-toggle="tab" href="#myLog">여행일기</a></li>		
			<li class="nav-item col-sm-4" id="tab2"><a class="nav-link" data-toggle="tab" href="#tagedLog">태그된 글</a></li>		
			<li class="nav-item col-sm-4" id="tab3"><a class="nav-link" data-toggle="tab" href="#pickLog">찜한 글</a></li>		
		</ul>
	</div>
	<!-- 마이페이지 컨텐츠 -->
	<div id="mypageContent">
		<div id="myLog"></div>
		<div id="tagedLog"></div>
		<div id="pickLog"></div>
	</div>
</div>
