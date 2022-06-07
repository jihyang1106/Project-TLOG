<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/userEdit.css" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<main>
	<div class="container">
		<div id="userEditContainer">
			<p id="userEditTitle">회원정보 수정</p>
			<div id="profile">
			<form id="profileFrm" method="post" action="#">
				<span><img src="/img/member/default_profile.png" id="previewImg"></span>&emsp;&emsp;
				<span><input type="file" id="profileImg" name="profileImg" onchange="LoadImg(this);"></span>
				<span id="profileNick">닉네임</span>&emsp;&emsp;
				<span><input type="text" name="nickname" id="profileInfoNick"/></span>
				<div id="profileSubmit"><input type="submit" value="회원정보수정" id="profileSubmitBtn"/></div>
			</form>
			<div id="hr-sect">태그선택</div>
	      	<c:forEach var="vo" items="${allTagList}">
				<span id="tagWord">#${vo.tagName }<input type="hidden" id="tagvalue" value=${vo.tagName } ></span>&emsp;
			</c:forEach>
			</div>
		</div>
	</div>
</main>
<script>
//top bottom 안보이게 하기
document.addEventListener("DOMContentLoaded", function(event){
   document.getElementById('top').style.display = "none";
   document.getElementById('bottom').style.display = "none";
});
//이미지 업로드 미리보기
function LoadImg(value){
	if(value.files && value.files[0]){
		const reader = new FileReader();
		reader.onload = function(e){
			const previewImg = document.getElementById('previewImg');
			previewImg.src = e.target.result;
		}
		reader.readAsDataURL(value.files[0]);
	}
}
//태그 토글 어케하누
$('#tagWord').click(function(){
	$(this).toggleClass("checked");
});
</script>
