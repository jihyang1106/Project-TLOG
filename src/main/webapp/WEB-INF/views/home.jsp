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

<!-- ============================ HTML ========================================================================== -->
	<div class="introduce_wrap">
		<div class="introduce_b">
			<div class="introduce_img">
				<img src="/img/home/09.gif">
			</div>
			<div class="introduce_info">
				<h3>&#128747;기억하고 싶은 여행&#128747;</h3>
				<p>당신의 여행을 기록해보세요</p>
				<button type="button" class="btn btn-outline-light">기록하기</button>
			</div>
			<div class="introduce_bg"></div>
			<i class="bi bi-chevron-compact-down"></i>
		</div>
	</div>
	<div class="container">
		<!-- 본문 내용 작성하기 -->
		<!-- 로그인 안했을때 좋아요많은글, 로그인했을때 팔로워 최신글 -->
		<div class="editor_pic">
			<h3 class="txt_tlog txt_title">B E S T &nbsp; F O L L O W E R</h3>
			<p class="txt_desc">
				<span class="txt_tlog">인기있는 유저에게 팔로우해보세요!</span>
			</p>
			<div class="wrap_slide">
				<ul class="list_slide" style="width: 900%;">
					<li>
						<div class="wrap_pic wrap_pic_type1">
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/00.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/01.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/02.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="wrap_pic wrap_pic_type2">
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/03.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/04.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type1">
								<a href="/" class="link_item"><img src="/img/home/05.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="wrap_pic wrap_pic_type3">
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/00.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/01.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/02.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
							<div class="item_pic item_pic_type2">
								<a href="/" class="link_item"><img src="/img/home/00.jpg"></a>
								<div class="append_info">
									<div class="info_g">
										<strong class="info_tit">
											인생 첫 유럽
											<br>
											8개 국가 13개 도시
											<br>
										</strong>
										<span class="info_by">
											<span class="ico_by">by</span>
											윤뚜뚜
										</span>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="wrap_btn">
				<!-- <i class="fa-solid fa-chevron-left" style="font-size: 100px; "></i> 
				<a href="/"><i class="fa-solid fa-chevron-right" style="font-size: 50px; color:white;"></i></a>-->
				<a href="/" class="slide_btn"><span class="btn_left"><i class="bi bi-arrow-left-circle-fill" style="font-size: 80px; "></i></span></a>
				<a href="/" class="slide_btn"><span class="btn_right"><i class="bi bi-arrow-right-circle-fill" style="font-size: 80px;"></i></span></a>
			</div>
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
				<ul class="list_wirters list_writers_group">
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>							
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
					<li>
						<a href="/" class="link_follow">
							<img src="/img/member/default_profile.png" width="80" height="80" class="img_witer">
							<strong class="tit_wirter">윤뚜뚜</strong>
						</a>
						<div class="follow_tag_wrap">
							<span>국외</span>
							<span>10대</span>
							<span>북아메리카</span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 태그 리스트 -->
		<div class="tag_wrap">
			<h3 class="txt_tlog txt_title">T L O G &nbsp; K E Y W O R D</h3>
			<p class="txt_desc">
				<span class="txt_tlog">태그로 분류된 다양한 글 모음</span>
			</p>
			<ul class="tag_list">
				<c:forEach var="t" items="${tagList}">
					<li class="tag_item" id='tag${t.tagNum}'
					 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
						<p>${t.tagName}</p>
					</li>
				</c:forEach>
				<li class="tag_item_end"></li>
			</ul>
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
					<li onclick="location.href='/member/profile?userNum=${vo.userNum}'">
						<img src='/upload/user/${vo.profileImg}.png' height='30px'/>${vo.userNick}
					</li>
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
					<li onclick="location.href='/member/profile?userNum=${vo.userNum}'">
						<img src='/upload/user/${vo.profileImg}.png' height='30px'/>${vo.userNick}
					</li>
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
		
		
		
	</div>
