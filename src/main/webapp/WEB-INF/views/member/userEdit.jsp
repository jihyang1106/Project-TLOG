<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/welcomePage.css" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="module" src="/js/member/userEdit.js"></script>
<main>
	<div class="container">
		<div id="welcomeContainer">
			<p id="welcomeTitle">회원 정보 수정</p>
			<div id="profile">
			<form id="profileFrm" method="post" action="/member/userEditOk" enctype="multipart/form-data">
				<!-- 프로필 파일 저장용 -->
				<input type="hidden" name="userNum" value="${userInfo.userNum }"/>
				<input id="imgFile" name="profileImgs" type="file" hidden="true" accept="image/jpg, image/jpeg, image/png">
				<input id="profile" name="profileImg" type="hidden" value="${userInfo.profileImg }">
				<c:if test="${userInfo.idKakao!=null}">
					<span><input type="hidden" name="idKakao" value="${userInfo.idKakao }"/></span>&emsp;&emsp;
				</c:if>
				<c:if test="${userInfo.profileImg==null}">
					<span><label for="imgFile" title="이미지 업로드"><img src="/upload/user/default_profile.png" id="previewImg"></label></span>&emsp;&emsp;
				</c:if>
				<c:if test="${userInfo.profileImg!=null}">
					<span><label for="imgFile" title="이미지 업로드"><img src="${userInfo.profileImg}" id="previewImg"></label></span>&emsp;&emsp;
				</c:if>
				<span><input id="defaultProfile" type="button" value="이미지 제거"></span>
				<span id="profileNick">닉네임</span>&emsp;&emsp;
				<c:if test="${userInfo.userNick!=null}">
					<span><input type="text" name="userNick" id="profileInfoNick" value="${userInfo.userNick}"/></span>
				</c:if>	
				<c:if test="${userInfo.userNick==null}">
					<span><input type="text" name="userNick" id="profileInfoNick"/></span>
				</c:if>
				<button type="button" onclick="location.href='/member/memberDel?userNum=${userInfo.userNum}'">회원탈퇴</button>
				<div id="profileSubmit"><input type="submit" value="정보등록" id="profileSubmitBtn"/></div>
				<div id="hr-sect">태그선택</div>
				<div id="allTagCnt">
		      	<c:forEach var="vo" items="${allTagList}" varStatus="st">
		      		<span id="tagWord${vo.tagNum }" class="tagWord" >#${vo.tagName }<input type="checkbox" name="tagListCl"  id="tagvalue${st.index }" class="tagvalue" hidden="true" value=${vo.tagNum } ></input><input type="hidden" id="tagStatus${vo.tagNum}" value="N" ></span>&emsp;
				</c:forEach>
				</div>
				<div id="myTagCnt" hidden="true">
		      	<c:forEach var="vo" items="${myTagList}" varStatus="st">
		      		<span class="myTag${st.index }">${vo.tagNum }</span>&emsp;
				</c:forEach>
				</div>
			</form>
			</div>
		</div>
	</div>
</main>
