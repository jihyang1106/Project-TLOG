<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ===================================== CSS ================================================================== -->
<style>
	#div_big{
		margin:0 auto;
		width:70vw;
		text-align:center;
	}
	#div_small{	
		padding:5vw;
		padding-left:12vw;
		padding-right:12vw;	
		line-height:2vw;		
	}
	/* ===== text설정 ===== */
	.texts{
		border:none;
		border-bottom:2px solid #ddd;
	}
	input[type=date] { 
	  border:none;
	  margin-left:2vw;
	  margin-right:2vw;
	}
	/* ===== 태그 ===== */
	.tags{
		border-radius: 5px;
		padding: 0.2vw;
		padding-left:0.4vw;
		padding-right:0.4vw;
		font-size:0.7vw;
		cursor:pointer;
		background-color:#eee;
	}
	#tag_li{
		line-height:1vw;
	}
	/* ===== 태그할 유저 =====*/
	#plus{	
		display:inline-block;
		width:30px;
		height:30px;
		border: 4px solid #ddd;
		border-radius: 50%;
		padding:5px;
		font-size:20px;
		cursor:pointer;
		top:0;
	}
	#tag_user_ul{
		margin:30px;
	}
	#tag_user_ul li{
		float:left;
		margin-left:5px;
		margin-right:5px;
		font-size: 15px;
	}
	.tag_box{
		width:100px;
		height:30px;
		border-radius:5px;
		border:1px solid #aaa;
	}
	.fa-xmark{
		width:5px;
		cursor:pointer;
	}
	/*===== 검색된 유저 리스트 =====*/
	.search_user_ul{
		float:left;
		text-align:left;
	}
	.search_user_li{
		cursor:pointer;
	}
	.profile_img{
		width:30px;
	}
	/* ===== 이미지 추가 =====*/
	.log_img_top {
		border: 1px solid rgba(118, 118, 118, 0.5);
		width: 100px;
		height: 30px;
		overflow: hidden;
		color: gray;
		cursor: pointer;
		text-align: center;
		margin:0 auto;
	}
	.log_img_wrap {
		border: 1px solid rgba(118, 118, 118, 0.5);
		width: 300px;
		height: 400px;
		overflow: hidden;
		color: gray;
		cursor: pointer;
		text-align: center;
	}
	.t_img{
		max-width: 300px;
		max-height: 400px;
	}
</style>
<!--====================================== HTML ===================================================================-->
<div id='div_big'>
<div id='div_small'>
	<form id='log_form' action='/myLog/logWriteOk' method='POST' enctype="multipart/form-data">
		<ul>
			<li>제목 : <input type='text' name='tTitle' class='texts'/></li>
			<li><input type='date' name='startDate'/> ~ <input type='date' name='endDate'/></li>
			<li>위치정보(임시) : <input type='text' name='placeInfo' class='texts'/></li>
			<li>
		      <label><input type="radio" name="isPrivate" value="1"> 비밀일기 </label>
		      <label><input type="radio" name="isPrivate" value="0"> 공유일기 </label>
		    </li>
		    <li id='tag_li'>
			    <c:forEach var="t" items="${tagList}" varStatus='status'>
					<span class='tags' id='tag${t.tagNum}'>
						${t.tagName} 
					</span><input type='checkbox' name='tagNumList' id='chk${t.tagNum}' value='${t.tagNum}' style='display:none;'>&nbsp;
					<c:if test='${status.index==13}'>
						<br/><br/>
					</c:if>
				</c:forEach>
		    </li>
		    <li>
			    <ul id='tag_user_ul'>
					<li><img src='/img/plus.jpg' id='plus' onclick='PlusUser()'/>&nbsp;&nbsp;tagUser</li>
				</ul>
		    </li>
		</ul>
		<br/><br/><br/><br/>
		<div class="log_img_top">
			<span class="img_upload_phr">여행 사진 등록</span> 
			<img src="" class="t_img" />
		</div>
	    <input type="file" name="images" class="log_img" style="display: none" multiple required/>
	</form>	
	<!-- 엘리먼트 추가될 div -->
	<div id='detail_div'></div>
    <input type='button' id='write_btn' value='일기 등록'/>
</div>
</div>
<script src='/js/log/logWrite.js'></script>
