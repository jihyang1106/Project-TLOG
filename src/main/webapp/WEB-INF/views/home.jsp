<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
//클릭이벤트: 일기 상세 리스트
/* function logDetail(tNum){ 
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
}*/
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
		<!-- 본문 내용 작성하기 -->
		<!--<div>
			  소개사진 같은것 넣기 
		</div>-->
		
		<!-- 로그인 안했을때 좋아요많은글, 로그인했을때 팔로워 최신글 -->
		<div class="editor_pic">
			<div class="wrap_slide">
				<ul class="list_slide" style="width: 200%;">
					<li>
						<div class="wrap_pic wrap_pic_type1">
							<div class="item_pic item_pic_type1 #home_discover_tlog">
								<a href="/" class="link_item"><img src="/img/home/00.jpg"></a>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/01.jpg"></a>
							</div>
							<div class="item_pic item_pic_type3">
								<a href="/" class="link_item"><img src="/img/home/02.jpg"></a>
							</div>
						</div>
					</li>
					<li>
						<div class="wrap_pic wrap_pic_type2">
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/03.jpg"></a>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/04.jpg"></a>
							</div>
							<div class="item_pic item_pic_type3">
								<a href="/" class="link_item"><img src="/img/home/05.jpg"></a>
							</div>
						</div>
					</li>
					<!--<li>
						<div class="wrap_pic wrap_pic_type3">
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/list_00.jpg"></a>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/list_01.jpg"></a>
							</div>
							<div class="item_pic item_pic_type3">
								<a href="/" class="link_item"><img src="/img/home/list_02.jpg"></a>
							</div>
						</div>
					</li>  -->
				</ul>
			</div>
		</div>
		<div class="wrap_btn">
			<!-- <i class="fa-solid fa-chevron-left" style="font-size: 100px; "></i> -->
			<a href="/"><i class="fa-solid fa-chevron-right" style="font-size: 50px; color:white;"></i></a>
		</div>
		<div class="wrap_paging">
			<img src="/img/home/paging.jpg">
		</div>
		
		<!-- 팔로워 많은 유저 리스트 -->
		<div class="best_follow">
			<h3 class="txt_tlog txt_title">B E S T &nbsp; F O L L O W E R</h3>
			<p class="txt_desc">
				<span class="txt_tlog">인기있는 유저에게 팔로우해보세요!</span>
			</p>
			<div class="wrap_follow">
				<ul class="list_writers list_writers_group">
					<li><img src="/img/home/whiter.JPG"></li>
					<li><img src="/img/home/whiter.JPG"></li>
					<li><img src="/img/home/whiter.JPG"></li>
					<li><img src="/img/home/whiter2.JPG"></li>
					<li><img src="/img/home/whiter2.JPG"></li>
					<li><img src="/img/home/whiter2.JPG"></li>
				</ul>
			</div>
		</div>
		
		<!-- 태그 리스트 -->
		<div>
		
		</div>
		
		<!-- 로그인 안했을때 좋아요많은글, 로그인했을때 팔로워 최신글 
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
		</div>-->
		
		
		<!-- 팔로워 많은 유저 리스트 
		<div>
			<c:forEach var="vo" items="${followedUser}">
				<ul>
					<li>${vo.userNum}</li>
					<li>${vo.profileImg}</li>
					<li>${vo.userNick}</li>
					<li>${vo.followerNum}</li>
					<li>
						<c:forEach var="t" items="${vo.tagList}" end="2"><!-- 태그3개(임시)
							<span class='tags' id='tag${t.tagNum}'
							 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
								${t.tagName}
							</span>&nbsp;
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		</div>-->
		
		
		<!-- 태그 리스트 
		<div>
			<ul>
				<c:forEach var="t" items="${tagList}">
					<li class='tags' id='tag${t.tagNum}'
					 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
						${t.tagName}
					</li>
				</c:forEach>
			</ul>
		</div>-->
	</div>
