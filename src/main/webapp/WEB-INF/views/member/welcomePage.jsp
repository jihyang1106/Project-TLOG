<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/welcomePage.css" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="module" src="/js/member/welcomePage.js"></script>
<main>
	<div class="container">
		<div id="welcomeContainer">
			<p id="welcomeTitle">추가 정보 입력</p>
			<div id="profile">
			<form id="profileFrm" method="post" action="/member/welcomePageOk" enctype="multipart/form-data">
				<!-- 프로필 파일 저장용 -->
				<input type="hidden" name="userNum" value="${kakaoVO.userNum }"/>
				<div id=profileImgSection>
					<input id="imgFile" name="profileImgs" type="file" hidden="true" accept="image/jpg, image/jpeg, image/png">
					<input id="profile" name="profileImg" type="hidden" value="${kakaoVO.profileImg }">
					<c:if test="${kakaoVO.idKakao!=null}">
						<span><input type="hidden" name="idKakao" value="${kakaoVO.idKakao }"/></span>&emsp;&emsp;
					</c:if>
					<c:if test="${kakaoVO.profileImg==null}">
						<span><label for="imgFile" title="이미지 업로드"><img src="/upload/user/default_profile.png" id="previewImg"></label></span>&emsp;&emsp;
					</c:if>
					<c:if test="${kakaoVO.profileImg!=null}">
						<span><label for="imgFile" title="이미지 업로드"><img src="${kakaoVO.profileImg }" id="previewImg"></label></span>&emsp;&emsp;
					</c:if>
					<span><input id="defaultProfile" type="button" value="이미지 제거"></span>
				</div>
				<div id="profileNickSection">
					<span id="profileNick">닉네임</span>&emsp;&emsp;
					<c:if test="${kakaoVO.userNick!=null}">
						<span><input type="text" name="userNick" id="profileInfoNick" value="${kakaoVO.userNick }"/></span>
					</c:if>	
					<c:if test="${kakaoVO.userNick==null}">
						<span><input type="text" name="userNick" id="profileInfoNick"/></span>
					</c:if>
				</div>
				<div id="profileSubmit"><input type="submit" value="정보등록" id="profileSubmitBtn"/></div>
				<div id="hr-sect">태그선택</div>
				<div id="tagSection">
			      	<c:forEach var="vo" items="${allTagList}" varStatus="st">
			      		<span class="tagWord">#${vo.tagName }<input type="checkbox" name="tagListCl" class="tagvalue" hidden="true" value=${vo.tagNum } ></input><input type="hidden" id="tagStatus${vo.tagNum}" value="N" ></span>&emsp;
					</c:forEach>
				</div>
			</form>
			</div>
		</div>
	</div>
</main>