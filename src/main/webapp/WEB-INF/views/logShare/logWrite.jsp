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
					<span class="logWriteLiLeft">위치정보 : &emsp;<input type='text' name='placeInfo' id='locationTexts'/></span>&emsp;&emsp;
					<span class="logWriteLiRight"><input type='date' name='startDate'/> ~ <input type='date' name='endDate'/></span>
				</li>
			</ul>
			<div id='tag_li'>
		    <c:forEach var="t" items="${tagList}" varStatus='status'>
				<span class='tags' id='tag${t.tagNum}'>
					${t.tagName} 
				</span><input type='checkbox' name='tagNumList' id='chk${t.tagNum}' value='${t.tagNum}' style='display:none;'>&nbsp;
				<c:if test='${status.index==13}'>
					<br/><br/>
				</c:if>
			</c:forEach>
			<span id='tag_alert' style='color:orange; display:none;'>태그를 5개 이하로 선택해주세요.</span>
			</div>
			<div>
		    <ul id='tag_user_ul'>
				<li>동행&emsp;:&emsp;<img src='/img/plus.jpg' id='plus' onclick='PlusUser()'/></li>
			</ul>
			<ul class='search_user_ul'></ul>
			</div>
			<br/>
			<div class="log_img_top">
				<button class="img_upload_phr">여행 일기 추가</button> 
			</div>
		    <input type="file" name="images" class="log_img" style="display: none" multiple required/>
		</form>	
		<!-- 엘리먼트 추가될 div -->
		<div id='detail_div'></div>
	    <button id='write_btn'>일기등록</button>
	</div>
</div>
<script src='/js/logShare/logWrite.js'></script>