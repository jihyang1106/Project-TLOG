<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
//클릭이벤트: 일기 상세 리스트
function logDetail(tNum){
	var param={"tNum" : tNum};	
	$.ajax({
		data:param,
		url:'/home/logDetail',
		type:'GET',
		success:function(data){
			var tag="";
			for(var i=0; i<data.length; i++){
				tag += "<ul><li>"+data[i].tDetailNum+"</li>";
				tag += "<li>"+data[i].tNum+"</li>";
				tag += "<li>"+data[i].tImg+"</li>";
				tag += "<li>"+data[i].tContent+"</li>";
				tag += "<li>"+data[i].tPlace+"</li>";
				tag += "<li>"+data[i].isCoverImg+"</li>";
				tag += "<li>";
				for(j=0; j<data[i].tagUserList.length; j++){
					tag += "<span value='"+data[i].tagUserList[j].userNum+"'>"+data[i].tagUserList[j].userNick+"&nbsp;</span>";
				}
				tag += "</li></ul>";
			}
			$("#detail_div").html(tag);
		}
	})
}
</script>
<style>
/* ===== 태그 ===== */
.tags{
	border-radius: 5px;
	padding: 5px;
	padding-left:7px;
	padding-right:7px;
	font-size:11px;
}
/* ===== 태그 색상(변경해야됨!투명도 많이주기) ===== */
#tag1, #tag2{
	background-color: rgb(42, 76, 211, 70%);
}
#tag3, #tag4, #tag5, #tag6, #tag7{
	background-color: rgba(122, 140, 226, 80%);
}
#tag8, #tag9, #tag10, #tag11, #tag12, #tag13, #tag14{
	background-color: rgba(122, 140, 226, 30%);
}
#tag15, #tag16, #tag17, #tag18, #tag19, #tag20{
	background-color: #C3E2DD;
}
#tag21, #tag22, #tag23, #tag24, #tag25{
	background-color: #FEF5D4;
}
#tag26, #tag27, #tag28, #tag29{
	background-color: #EACACB;
}
</style>
<!-- ============================ HTML ========================================================================== -->
	<div class="container">
<<<<<<< HEAD
	<!-- 본문 내용 작성하기 -->
	홈페이지ㄹㄹ
=======
		<!-- 본문 내용 작성하기 -->
		홈페이지
		<div id='detail_div'>
			글 내용 div(임시)
		</div>
		=========================================================
		<!-- 로그인 안했을때 좋아요많은글, 로그인했을때 팔로워 최신글 -->
		<div>
			<c:forEach var="vo" items="${logList}">
				<ul id='log_ul' onclick="logDetail(${vo.tNum})">
					<li>${vo.coverImg}</li>
					<li>${vo.tTitle}</li>
					<li>${vo.startDate}</li>
					<li>${vo.endDate}</li>
					<li>${vo.likeNum}</li>
					<li>${vo.profileImg}</li>
					<li>${vo.userNick}</li>
					<li>
						<c:forEach var="t" items="${vo.tagList}">
							<span class='tags' id='tag${t.tagNum}'
							onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
								${t.tagName}
							</span>&nbsp;
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		</div>
		=========================================================
		<!-- 팔로워 많은 유저 리스트 -->
		<div>
			<c:forEach var="vo" items="${followedUser}">
				<ul>
					<li>${vo.userNum}</li>
					<li>${vo.profileImg}</li>
					<li>${vo.userNick}</li>
					<li>${vo.followerNum}</li>
					<li>
						<c:forEach var="t" items="${vo.tagList}" end="2"><!-- 태그3개(임시) -->
							<span class='tags' id='tag${t.tagNum}'
							 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
								${t.tagName}
							</span>&nbsp;
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		</div>
		=========================================================
		<!-- 태그 리스트 -->
		<div>
			<ul>
				<c:forEach var="t" items="${tagList}">
					<li class='tags' id='tag${t.tagNum}'
					 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
						${t.tagName}
					</li>
				</c:forEach>
			</ul>
		</div>
>>>>>>> ec75ab9956c7671b65ec8774c1655eaed19f6b03
	</div>
