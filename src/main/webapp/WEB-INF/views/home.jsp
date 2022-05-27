<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="container">
		<!-- 본문 내용 작성하기 -->
		홈페이지
		<!-- 컨트롤러 작업: 로그인 안했을때 좋아요많은글 불러오기, 로그인했을때 팔로워 최신글 불러오기
						 - 클릭 시(ajax로 travelDetail 뿌리기) -->
			<c:forEach var="vo" items="${logList}">
				<ul>
					<li>coverImg경로수정: ${vo.coverImg}</li>
					<li>tTitle: ${vo.tTitle}</li>
					<li>${vo.startDate}</li>
					<li>${vo.endDate}</li>
					<li>likeNum: ${vo.likeNum}</li>
					<li>profileImg경로수정: ${vo.profileImg}</li>
					<li>userNick: ${vo.userNick}</li>
					<li>tag: 
						<c:forEach var="tag" items="${vo.tagList}">
							${tag}&nbsp;
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		
		내가 팔로우하는 유저 글 불러오기
	</div>
