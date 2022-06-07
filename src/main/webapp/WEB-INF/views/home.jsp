<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	
/*const wrap_pic = 1;

$('#rightBtn').on('click', function(){
	console.log("클릭");
	$('.list_slide').css('transform', 'translateX(-' + wrap_pic + '00%)');
	wrap_pic += 1;
  })*/
  
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
	
	<!-- 로그인 안했을때 좋아요많은글, 로그인했을때 팔로워 최신글 -->
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
				<c:forEach items="${logList}" var="vo" varStatus="status" begin="1" end="16">
					<ul class="list_slide">
						<c:if test="${status.index <2 }" >
							<li class="testClass">
							<div class="wrap_pic wrap_pic_type1">
								<div class="item_pic item_pic_type1">
									<a href="location.href='/member/profile?userNum=${vo.userNum}'" class="link_item">${vo.coverImg}</a>
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
						
						</c:if>
					
					
						
						<li class="testClass">
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
						<li class="testClass">
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
						<li class="testClass">
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
						<li class="testClass">
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
					</ul>
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
								<img src='/upload/user/${vo.profileImg}' width="80" height="80" class="img_witer">
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
		
		<!-- <div class="editor_pic">
			<h3 class="txt_tlog txt_title">B E S T &nbsp; F O L L O W E R</h3>
			<p class="txt_desc">
				<span class="txt_tlog">인기있는 유저에게 팔로우해보세요!</span>
			</p>
			<div class="wrap_slide">
				<c:forEach var="vo" items="${logList}">
					<ul class="list_slide">
						<li class="testClass">
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
						<li class="testClass">
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
						<li class="testClass">
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
						<li class="testClass">
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
						<li class="testClass">
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
					</ul>
				</c:forEach>
			</div> -->
	
		
		
		
		
		
		
		
	</div>