<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/*====================log 글====================*/
#log_big{
	display:inline-block;
	/*height:90vh;*/
	margin-bottom: 45px;
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
.coverImgDiv{
	width:18vw;
	height:24vw;
	margin:1vw 0;
	display:inline;
	position:relative;
}
.coverImg{
	max-width:18vw;
	max-height:24vw;
	border-radius:10px;
	box-shadow:0 0 10px rgba(0,0,0,30%);
	
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

.tags{
	background-color:var(--theme-lightblue-30);
	padding:3px 5px;
	border-radius:10px;
}
.current{
	display : block;
}
</style>
<div id='log_big'>
<div id='log_list_div'>
	<div class='log_div'>
		<ul class='log_ul' onclick='logDetail(${vo.tNum})'>
			<li>
				<div class='coverImgDiv'>
					<img src='/upload/log/${vo.coverImg}' class='coverImg'/>
					<div id='titleDiv'>
						<c:if test="${vo.isPrivate==1}">
							<span><i class='fa-solid fa-lock'></i></span>&emsp;
						</c:if>
						<span class='logTitle'>${vo.tTitle}</span>
					</div>
				</div>
			</li>
			<li class='profileInfo'>
				<span onclick="location.href='/member/profile?userNum=${vo.userNum}'">
				<img src='/upload/user/${vo.profileImg}' class='logProfileImg'/></span>&emsp;
				<span class='logNick' onclick="location.href='/member/profile?userNum=${vo.userNum}'">${vo.userNick}</span>
				<span class='logLike'><i class='fa-solid fa-thumbs-up'></i>&emsp;${vo.likeNum}</span>
			</li>
			<hr/>
			<li> with &nbsp;&nbsp;&nbsp;
				<c:forEach var='t' items='${vo.tagUserList}'>				
						<span class='users' onclick="location.href='/member/profile?userNum=${t.userNum}'">
							<img src='/upload/user/${t.profileImg}' class='tagProfileImg'/>
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
		</ul>
	</div>
</div>
<c:forEach var='dvo' items='${detailList}'>
	<div id='log_list_div'>
		<div class='log_div'>
			<ul class='log_ul'>
				<li>
					<div class='coverImgDiv'>
						<img src='/upload/log/${dvo.tImg}' class='coverImg'/>
					</div>
				</li>
				<li>${dvo.tContent}</li>
				<li>${dvo.tPlace} 에서</li>		
			</ul>
		</div>
	</div>
</c:forEach>
</div>	
			