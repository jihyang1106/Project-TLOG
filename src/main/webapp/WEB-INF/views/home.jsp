<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
	
=======
<script>
  	var index = 1;	
	$(function () {
		// 캐러셀
		const leftBtn = document.querySelector('#leftBtn');
		const rightBtn = document.querySelector('#rightBtn');
		const carousel = document.querySelector('.list_slide');
		leftBtn.addEventListener('click', () => {
			console.log("왼쪽 클릭");
			if (index === 0) return;
			index -= 1;
			console.log("왼쪽 클릭 index",index);
			carousel.style.transform = 'translate('+(-960*index)+'px, 0)';
		});	
		rightBtn.addEventListener('click', () => {
			console.log("오른쪽 클릭");
			if (index === 4) return;
			index += 1;
			console.log("오른쪽 클릭 index", index);
			carousel.style.transform = 'translate('+(-960*index)+'px, 0)';
		});		
		init();
	  });	  
	  // 페이지 번호    	  
	  var link_page = document.getElementsByClassName("link_page");	  
	  function handleClick(event) {
		  console.log(event.target);
		  console.log("ㄹㄹㄹㄹㄹㄹㄹ");
		  // 콘솔창을 보면 둘다 동일한 값이 나온다
		  
		  console.log(event.target.classList[1].substr(8,8));

		  const carousel = document.querySelector('.list_slide');
		  
		  if (event.target.classList[1] === "clicked") {
			  event.target.classList.remove("clicked");
			  console.log("바뀌냐..?");
		  } else {
			  for (var i = 0; i < link_page.length; i++) {
				  link_page[i].classList.remove("clicked");
			  }
			  console.log("클릭");
			  event.target.classList.add("clicked");
			  index = event.target.classList[1].substr(8,8)-1;
			  carousel.style.transform = 'translate('+(-960*index)+'px, 0)';
		  }
	  }
	  function init() {
		  for (var i = 0; i < link_page.length; i++) {
			  link_page[i].addEventListener("click", handleClick);
			  console.log("클릭클릭");
		  }
	  }
</script>
>>>>>>> 93a8170acc79f002220ba488c7f07e11bfca3ecc
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
			<h3 class="txt_tlog txt_title">T L O G &nbsp; P O S T</h3>
			<p class="txt_desc">
				<span class="txt_tlog">인기있는 유저에게 팔로우해보세요!</span>
			</p>		
			<div class="wrap_slide">
				<c:forEach items="${logList}" var="vo" varStatus="status" >
				<div>${status.end }</div>
				<c:out value="${status.index}" /> / <c:out value="${status.end}" />
					<c:if test="${status.index == 0 }" >					
						<ul class="list_slide">
							<li class="testClass">
								<div class="wrap_pic wrap_pic_type1">
									<div class="item_pic item_pic_type1">
									<div class="link_item" onclick="window.open('/logShare/logView?tNum=${vo.tNum}')"><img src="/upload/log/${vo.coverImg}"></div>
										<a href="location.href='/member/profile?userNum=${vo.userNum}'" ></a>
										<div class="append_info">
											<div class="info_g">
												<strong class="info_tit">
													${vo.tTitle}
												</strong>
												<span class="info_by">
													<span class="ico_by">by</span>
													${vo.userNick}
												</span>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${status.index == 1 }" >		
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 2 }" >
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${status.index == 3 }" >
							<li class="testClass">
								<div class="wrap_pic wrap_pic_type2">
									<div class="item_pic item_pic_type1">
										<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
										<div class="append_info">
											<div class="info_g">
												<strong class="info_tit">
													${vo.tTitle}
												</strong>
												<span class="info_by">
													<span class="ico_by">by</span>
													${vo.userNick}
												</span>
											</div>
										</div>
									</div>
								</c:if>
							<c:if test="${status.index == 4 }" >		
								<div class="item_pic item_pic_type1">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 5 }" >
								<div class="item_pic item_pic_type1">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${status.index == 6 }" >
							<li class="testClass">
								<div class="wrap_pic wrap_pic_type3">
									<div class="item_pic item_pic_type2">
										<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
										<div class="append_info">
											<div class="info_g">
												<strong class="info_tit">
													${vo.tTitle}
												</strong>
												<span class="info_by">
													<span class="ico_by">by</span>
													${vo.userNick}
												</span>
											</div>
										</div>
									</div>
								</c:if>
							<c:if test="${status.index == 7 }" >		
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 8 }" >		
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 9 }" >
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${status.index == 10 }" >
							<li class="testClass">
								<div class="wrap_pic wrap_pic_type1">
									<div class="item_pic item_pic_type1">
										<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
										<div class="append_info">
											<div class="info_g">
												<strong class="info_tit">
													${vo.tTitle}
												</strong>
												<span class="info_by">
													<span class="ico_by">by</span>
													${vo.userNick}
												</span>
											</div>
										</div>
									</div>
								</c:if>
							<c:if test="${status.index == 11 }" >		
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 12 }" >
								<div class="item_pic item_pic_type2">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${status.index == 13 }" >
							<li class="testClass">
								<div class="wrap_pic wrap_pic_type2">
									<div class="item_pic item_pic_type1">
										<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
										<div class="append_info">
											<div class="info_g">
												<strong class="info_tit">
													${vo.tTitle}
												</strong>
												<span class="info_by">
													<span class="ico_by">by</span>
													${vo.userNick}
												</span>
											</div>
										</div>
									</div>
								</c:if>
							<c:if test="${status.index == 14 }" >		
								<div class="item_pic item_pic_type1">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index == 15 }" >
								<div class="item_pic item_pic_type1">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item"><img src="/upload/log/${vo.coverImg}"></a>
									<div class="append_info">
										<div class="info_g">
											<strong class="info_tit">
												${vo.tTitle}
											</strong>
											<span class="info_by">
												<span class="ico_by">by</span>
												${vo.userNick}
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</c:if>
			</c:forEach>
		</div>		
			<div class="wrap_btn">
				<!-- <i class="fa-solid fa-chevron-left" style="font-size: 100px; "></i> 
				<a href="/"><i class="fa-solid fa-chevron-right" style="font-size: 50px; color:white;"></i></a>-->
				<button class="slide_btn btn_left" id="leftBtn"><i class="bi bi-arrow-left-circle-fill" style="font-size: 80px; "></i></button>
				<button class="slide_btn btn_right" id="rightBtn"><i class="bi bi-arrow-right-circle-fill" style="font-size: 80px;"></i></button>
			</div>
		</div>
		<div class="wrap_paging">
			<ul class="paging_list">
				<li><a href="javascript:;" class="link_page txt_page1" data-page="2">01</a></li>
				<li><a href="javascript:;" class="link_page txt_page2" data-page="2">02</a></li>
				<li><a href="javascript:;" class="link_page txt_page3" data-page="3">03</a></li>
				<li><a href="javascript:;" class="link_page txt_page4" data-page="4">04</a></li>
				<li><a href="javascript:;" class="link_page txt_page5" data-page="5">05</a></li>
			</ul>
		</div>	
		<!-- 팔로워 많은 유저 리스트 -->
		<div class="best_follow">
			<h3 class="txt_tlog txt_title">B E S T &nbsp; F O L L O W E R</h3>
			<p class="txt_desc">
				<span class="txt_tlog">인기있는 유저에게 팔로우해보세요!</span>
			</p>
			<div class="wrap_follow">
				<c:forEach var="vo" items="${followedUser}" >
					<ul class="list_wirters list_writers_group">
						<li>
							<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_follow">
								<img src='${vo.profileImg}' width="80" height="80" class="img_witer">
								<strong class="tit_wirter">${vo.userNick}</strong>
							</a>
							<p class="follow_count"><i class="bi bi-person-heart" style="font-size:15px;"></i>&nbsp;${vo.followerNum}</p>	
							<div class="follow_tag_wrap">
								<c:forEach var="t" items="${vo.tagList}" end="2"><!-- 태그3개(임시)-->
									<span class='tags' id='tag${t.tagNum}'
									 onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
										${t.tagName}
									</span>&nbsp;
								</c:forEach>
							</div>
						</li>
					</ul>
				</c:forEach>
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
	</div>