<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src='/js/logShare/logView.js'></script>
<style>
/*====================log 글====================*/
#log_big{
	/*display:inline-block;
	height:90vh;*/
	text-align: center;
	width: 1500px;
	margin: 90px auto;
	background-color: aliceblue;
}
#log_big div{
	display:inline-block;
}
.log_list_div{
	clear:both;
	float:center;
	width:70vw;
	position:relative;
	margin:100px 0px !important;
}
.log_div{
	margin:1vw;
	padding:2vw;
	width:22vw;
	display:inline-block;
	text-align:center;
	border-radius:15px;
	box-shadow:0 0 10px rgba(0,0,0,30%);
}
.log_div i{
	color:rgba(0,0,0,30%);
}
.log_ul{
	list-style-type:none;
}
.log_ul li{
	height:4vh;
	line-height:4vh;
}
.log_ul li:first-child{
	height:100%;
	line-height:40px;
}
.titleDiv {
  position:absolute;
 }
.logTitle{
	font-size:1.1em;
	font-weight:600;
}
.profileInfo{
	height:40px;
	line-height:40px;
	text-align:left;
	padding:0px 30px;
}
.logProfileImg{
	width:40px;
	height:40px;
}
.tagProfileImg{
	width:20px;
	height:20px;
}
.logLike{
	float:right;
}
.fa-thumbs-up{
	font-size:2vw;
}
.tags{
	padding:3px 5px;
	border-radius:10px;
	cursor:pointer;
	background-color:#ddd;
}
/* ===== 태그 색상(변경해야됨!) ===== */
#tag1, #tag2{
	background-color: rgba(42, 76, 211, 30%);
}
#tag3, #tag4, #tag5, #tag6, #tag7{
	background-color: rgba(166, 198, 252, 50%);
}
#tag8, #tag9, #tag10, #tag11, #tag12, #tag13, #tag14{
	background-color: rgba(122, 140, 226, 30%);
}
#tag15, #tag16, #tag17, #tag18, #tag19, #tag20{
	background-color: rgba(195, 226, 221, 50%);
}
#tag21, #tag22, #tag23, #tag24, #tag25{
	background-color: #FEF5D4;
}
#tag26, #tag27, #tag28, #tag29{
	background-color: rgba(234, 202, 203, 50%);
}
.current{
	display : block;
}
.carousel{
	margin:0 auto;
	
}
.carousel-caption{
	color:black;
	width:50vw;
}
.imgs{
	max-width:25vw;
	max-height:25vw;
	box-shadow:0 0 10px rgba(0,0,0,30%);
	display:block;
	margin-bottom:300px;
}
</style>
<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
	<c:forEach var="vo" items="${detailList}" varStatus="status">		
		<li data-target="#demo" data-slide-to="${status.index+1}"></li>
	</c:forEach>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
       <img src='/upload/log/${vo.coverImg}' class='imgs'/>
			      <div class="carousel-caption">			
			        <ul>
			        	<li>
			        		<div id='titleDiv'>
								<c:if test="${vo.isPrivate==1}">
									<span><i class='fa-solid fa-lock'></i></span>&emsp;
								</c:if>
								<span class='logTitle'>${vo.tTitle}</span>
							</div>
						</li>
						<li class='profileInfo'>
							<span onclick="location.href='/member/profile?userNum=${vo.userNum}'">
							<img src='${vo.profileImg}' class='logProfileImg'/></span>&emsp;
							<span class='logNick' onclick="location.href='/member/profile?userNum=${vo.userNum}'">${vo.userNick}</span>
							<span class='logLike'>
								<c:if test="${vo.likeType==0}">
									<i class='fa-regular fa-thumbs-up' onclick='LikeUp(${vo.tNum})' style='color:rgba(122, 140, 226,100%);'></i> &emsp;${vo.likeNum}
								</c:if>
								<c:if test="${vo.likeType==1}">
									<i class='fa-solid fa-thumbs-up' onclick='LikeDown(${vo.tNum})' style='color:rgba(122, 140, 226,100%);'></i> &emsp;${vo.likeNum}
								</c:if>				
								
							</span>
						</li>
						<hr/>
						<li> with &nbsp;&nbsp;&nbsp;
							<c:forEach var='t' items='${vo.tagUserList}'>				
									<span class='users' onclick="location.href='/member/profile?userNum=${t.userNum}'">
										<img src='${t.profileImg}' class='tagProfileImg'/>
										&nbsp;${t.userNick}
									</span>&nbsp;
							</c:forEach>
						</li>
						<li><span>${vo.startDate}</span>&nbsp;~&nbsp;<span>${vo.endDate}</span></li>
						
						<li>
							<c:forEach var='t' items='${vo.tagList}'>				
									<span class='tags' id='tag${t.tagNum}' onclick="location.href='/logShare/logList/searchs?searchKey=tag&searchWord=${t.tagName}'">
										${t.tagName}
									</span>&nbsp;
							</c:forEach>
						</li>		
						<!-- <c:if test="${logNum==vo.userNum}"></c:if>-->
							<li>
								<span class='tags' onclick='logEdit(${vo.tNum})'>수정</span>
								<span class='tags' onclick='logDel(${vo.tNum})'>삭제</span>
							</li>
						</ul>
					</div>
    </div>
    			<c:forEach var='dvo' items='${detailList}'>		
				    <div class="carousel-item">				
				      <img src='/upload/log/${dvo.tImg}' class='imgs'/>				
				      <div class="carousel-caption">				
				        <div id='log_list_div'>
							<div class='log_div'>
								<ul class='log_ul'>
									<li>${dvo.tContent}</li>
									<li>${dvo.tPlace} 에서</li>		
								</ul>
							</div>
						</div>
				      </div>				
				    </div>
				</c:forEach>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>

