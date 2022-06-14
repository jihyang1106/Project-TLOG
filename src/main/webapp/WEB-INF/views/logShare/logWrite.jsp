<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/logShare/logWrite.css" type="text/css">
<!--====================================== HTML ===================================================================-->
<div id='div_big'>
	<div id='div_small'>
		<form id='log_form' action='/logShare/logWriteOk' method='POST' enctype="multipart/form-data">
			<ul class="logWriteUl">
				<li class="logWriteLi">
					<label><input type="radio" name="isPrivate" value="1"> 비밀일기</label>&emsp;&emsp;
			    	<label><input type="radio" name="isPrivate" value="0"> 공유일기</label>
				</li>
				<li class="logWriteLi">
					<span class="logWriteLiLeft">제목 : &emsp;<input type='text' name='tTitle' id='titleTexts'/></span>
				</li>
				<li class="logWriteLi">
					<span class="logWriteLiLeft">위치 : &emsp;<input type='text' name='placeInfo' id='locationTexts'/></span>&emsp;&emsp;
					<span class="logWriteLiRight"><input type='date' name='startDate'/> &emsp;~&emsp; <input type='date' name='endDate'/></span>
				</li>
			</ul>
			<div id='user_tag_div'>
				<div id='tag_li'>
					<span id='tag_span'>태그</span>
					<hr/>
				    <c:forEach var="t" items="${tagList}" varStatus='status'>
						<c:if test='${status.index==0}'>
							<span class='tags' id='region'>지역</span><input type='checkbox' style='display:none;'>
						</c:if>
						<span class='tags' id='tag${t.tagNum}' style='display:none;'>
							${t.tagName} 
						</span><input type='checkbox' name='tagNumList' id='chk${t.tagNum}' value='${t.tagNum}' style='display:none;'>
						<c:if test='${status.index==13}'>
							<br/><br/><span class='tags' id='age'>나이</span><input type='checkbox' style='display:none;'>
						</c:if>
						<c:if test='${status.index==19}'>
							<br/><br/><span class='tags' id='group'>그룹</span><input type='checkbox' style='display:none;'>
						</c:if>
						<c:if test='${status.index==24}'>
							<br/><br/><span class='tags' id='season'>계절</span><input type='checkbox' style='display:none;'>
						</c:if>
					</c:forEach>
					<br/><br/>
					<span id='tag_alert' style='display:none; color:orange; text-align:center;'>태그를 5개 이하로 선택해주세요</span>
				</div>
				<div id='tag_user_div'>
					<span id='tag_user_span'>동행인&emsp;<i class="fa-solid fa-plus" id='plus' onclick='PlusUser()' ></i></span>
					<hr/>
				    <ul id='tag_user_ul'>
					</ul>
					<br/>
					<hr/>
					<ul class='search_user_ul'></ul>
				</div>
			</div>
			<br/>
			<div class="log_img_top">
				<button class="img_upload_phr">여행 일기 추가</button>
				<input type="file" name="images" class="log_img" style="display: none" multiple required/> 
			</div>
		</form>	
		<!-- 엘리먼트 추가될 div -->
		<div id='detail_div'></div>
	    <button id='write_btn' type="button">일기등록</button>
	</div>
</div>
<script src='/js/logShare/logWrite.js'></script>