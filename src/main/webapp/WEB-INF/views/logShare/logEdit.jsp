<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/logShare/logEdit.css" type="text/css">
<!--====================================== HTML ===================================================================-->
<div id='div_big'>
	<div id='div_small'>
		<form id='edit_form' action='/logShare/logEditOk' method='POST'>
			<input type='hidden' name='tNum' value='${vo.tNum}'/>
			<ul>
				<li>
			      <label><input type="radio" name="isPrivate" id='isPrivate1' value="1"> 비밀일기 </label>
			      <label><input type="radio" name="isPrivate" id='isPrivate0' value="0"> 공유일기 </label>
			    </li>
				<li>제목 : &emsp;<input type='text' name='tTitle' class='texts' value='${vo.tTitle}'/></li>
				<li><input type='date' name='startDate' value='${vo.startDate}'/> &emsp;~&emsp; <input type='date' name='endDate' value='${vo.endDate}'/></li>
				<li>위치 : &emsp;<input type='text' name='placeInfo' class='texts' value='${vo.placeInfo}'/></li>			
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
					</div>
					<div id='tag_user_div'>
						<span id='tag_user_span'>동행인&emsp;<i class="fa-solid fa-plus" id='plus' onclick='PlusUser()' ></i></span>
						<hr/>
					    <ul id='tag_user_ul'>
					    <c:forEach var='t' items='${vo.tagUserList}'>
							<li>
								<input type='hidden' name='userNumList' value='${t.userNum}'/>
								<input type='text' class='tag_box' value='${t.userNick}'/>
								<i class='fa-solid fa-xmark del_user'></i>
							</li>
						</c:forEach>
						</ul>
						<ul class='search_user_ul'></ul>
					</div>
				</div>
			</ul>
			<br/><br/><br/><br/>
		
		<div id='detail_div'>
			<c:forEach var='dvo' items='${detailList}'>				
				<div id='log_list_div'>	
					<i class='fa-solid fa-xmark del_log'></i>
					<input type='hidden' value='${dvo.isCoverImg}'>
					<div class='log_div'>	
						<ul class='log_ul'>
							<li>
							<c:if test='${dvo.isCoverImg==1}'>
								<span>대표 이미지</span>
							</c:if>
								<div class='coverImgDiv'>
									<img src='/upload/log/${dvo.tImg}' class='coverImg'/>
								</div>
							</li>
							<li>${dvo.tContent}</li>
							<li>${dvo.tPlace} 에서</li>		
						</ul>
					</div>					
				</div>	
				<input type='hidden' value='${dvo.tDetailNum}'>
			</c:forEach>
		</div>
	    <input type='button' id='write_btn' value='일기 수정'/>
	    </form>	
	</div>
</div>

<script>
/*================ 태그 선택 ==================*/
//.tags클릭 시 chk상태확인 후  css && chk 변화

$(".tags").click(function(){
	//체크된 상태일 때
	if($(this).next().is(":checked")){ 
		$(this).next().prop("checked", false); //체크 해제
		$(this).css("background-color", "#eee");
		if($(this).prop("id") == 'region'){
			for(var i=1; i<=14; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'tag1'){
			$("#tag2").css("display", "inline-block");
			for(var i=3; i<=7; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'tag2'){
			$("#tag1").css("display", "inline-block");
			for(var i=8; i<=14; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'age'){
			for(var i=15; i<=20; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'group'){
			for(var i=21; i<=25; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'season'){
			for(var i=26; i<=29; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}
	//체크된 상태 아닐 때
	}else{ 
		$(this).next().prop("checked", true);
		var id = $(this).attr('id');
		switch(id){
		case'region':
			$(this).css("background-color", "#aaa");
				$("#tag1").css("display", "inline-block");	
				$("#tag2").css("display", "inline-block");	
		break;
		case'tag1': case'tag2':
			$(this).css("background-color", "rgb(42, 76, 211, 70%)");
			if($(this).prop("id") == 'tag1'){
				$("#tag2").css("display", "none");
				$("#tag3").css("display", "inline-block");	
				$("#tag4").css("display", "inline-block");	
				$("#tag5").css("display", "inline-block");	
				$("#tag6").css("display", "inline-block");	
				$("#tag7").css("display", "inline-block");	
			}else if($(this).prop("id") == 'tag2'){
				$("#tag1").css("display", "none");
				$("#tag8").css("display", "inline-block");	
				$("#tag9").css("display", "inline-block");	
				$("#tag10").css("display", "inline-block");	
				$("#tag11").css("display", "inline-block");	
				$("#tag12").css("display", "inline-block");
				$("#tag13").css("display", "inline-block");	
				$("#tag14").css("display", "inline-block");	
			}
		break
		case'tag3': case'tag4': case'tag5': case'tag6': case'tag7':
			$(this).css("background-color", "rgba(122, 140, 226, 80%)");
		break
		case'tag8': case'tag9': case'tag10': case'tag11': case'tag12': case'tag13': case'tag14':
			$(this).css("background-color", "rgba(122, 140, 226, 30%)");
		break
		case'age':
			$(this).css("background-color", "#aaa");
				$("#tag15").css("display", "inline-block");	
				$("#tag16").css("display", "inline-block");
				$("#tag17").css("display", "inline-block");	
				$("#tag18").css("display", "inline-block");
				$("#tag19").css("display", "inline-block");	
				$("#tag20").css("display", "inline-block");	
		break;
		case'tag15': case'tag16': case'tag17': case'tag18': case'tag19': case'tag20':
			$(this).css("background-color", "#C3E2DD");
		break
		case'group':
			$(this).css("background-color", "#aaa");
				$("#tag21").css("display", "inline-block");	
				$("#tag22").css("display", "inline-block");
				$("#tag23").css("display", "inline-block");	
				$("#tag24").css("display", "inline-block");
				$("#tag25").css("display", "inline-block");	
		break;
		case'tag21': case'tag22': case'tag23': case'tag24': case'tag25':
			$(this).css("background-color", "#FEF5D4");
		break
		case'season':
			$(this).css("background-color", "#aaa");
				$("#tag26").css("display", "inline-block");	
				$("#tag27").css("display", "inline-block");
				$("#tag28").css("display", "inline-block");
				$("#tag29").css("display", "inline-block");	
		break;
		case'tag26': case'tag27': case'tag28': case'tag29':
			$(this).css("background-color", "#EACACB");
		break
		}
		
		
	}
})
/*================ 선택했던 태그 입력===================*/
 var list = [];
<c:forEach items="${vo.tagList}" var="t">
	list.push("#tag${t.tagNum}");
	if(1 <= ${t.tagNum} && ${t.tagNum}<=14 && !$("#region").next().is(":checked")){
		$("#region").trigger('click');
	}else if(15 <= ${t.tagNum} && ${t.tagNum}<=20 && !$("#age").next().is(":checked")){
		$("#age").trigger('click');
	}else if(21 <= ${t.tagNum} && ${t.tagNum}<=25 && !$("#group").next().is(":checked")){
		$("#group").trigger('click');
	}else if(26 <= ${t.tagNum} && ${t.tagNum}<=29 && !$("#season").next().is(":checked")){
		$("#season").trigger('click');
	}
</c:forEach>
 for (var index = 0; index<list.length; index++) {
 	//console.log(list[index]);
 	$(list[index]).trigger('click');
 }
 /*================ 선택했던 비밀일기/공유일기 입력===================*/
 if(${vo.isPrivate}==0){
	 $("#isPrivate0").trigger('click');
 }else{
	 $("#isPrivate1").trigger('click');
 }
/*================ 태그할 유저 선택 ==================*/
var cnt=${cnt};

function PlusUser(){
	if(cnt<6){
		var li ="<li><input type='hidden' name='userNumList'/><input type='text' class='tag_box'/>&nbsp;&nbsp;<i class='fa-solid fa-xmark'></i>&nbsp;&nbsp;&nbsp;</li>";
		$("#tag_user_ul").append(li);
		cnt++;
		//console.log(cnt);
		if(cnt>=6){
			$("#plus").css("display","inline-block"); //플러스버튼 지우기
		}
	}
}
//유저 박스 지우기
$(document).on("click", ".del_user", function() {
	$(this).parent().remove();
	cnt--;
	//console.log(cnt);
	if(cnt<5){
		$("#plus").css("display","block"); //플러스 버튼 보이기
	}
})
	//태그할 유저 자동검색
	$(document).on("keyup", ".tag_box", function() {
		if($(this).val().trim()!=""){
			var tagBox = $(this);
			var ul = $(".search_user_ul"); //유저리스트 들어갈 ul
			var data = {"userNick" : $(this).val()};
			//console.log(data);
			$.ajax({
		          url: '/logShare/searchUserList',
		          type: 'GET',
		          data: data,
		          success: function (data) {
		        	  var list = "";
		        	  for(var i=0; i<data.length; i++){
		        		  list += "<li class='search_user_li' value='"+data[i].userNum+"'>";
		        		  list += "<img src='"+data[i].profileImg+"' class='profile_img'/>&nbsp;"+data[i].userNick;
		        		  list += "</li>";
		        	  }
		        	  ul.html(list); //ul태그 안에 넣기
		        	  //console.log(list);
		        	  
		        		//검색된 유저 클릭 시====================================================================
		        		$(".search_user_li").on('click', function(){
		        			var userNum = $(this).val();
		        			var userNick = $(this).text();
		        			//console.log(userNum, userNick);
		        			tagBox.val(userNick); //inputText
		        			tagBox.prev().val(userNum); //inputHidden
		        			$(this).parent().empty(); //검색리스트 지우기
		        		})

		          },
		          error: function (e) {
			            alert("error = "+ e.responseText);
			      }
			   })
		}		
	});
/*=============== 일기상세 삭제 =================================================================*/
 $(document).on("click", ".del_log", function() {
	 if($(this).next().val()==1){
		 alert('대표이미지는 삭제할 수 없습니다.');
		 return false;
	 }else{
		 var tDetailNum = $(this).parent().next().val(); //input hidden에 value tDetailNum 넣기
		 var tag = "<input type='hidden' name='dNumList' value='"+tDetailNum+"'>";
		 $(this).parent().parent().append(tag);
		 $(this).parent().remove();
	 }
	 
 })
/*=============== 글 수정 =================================================================*/
$("#write_btn").click(function(){
	if(confirm('글을 수정하시겠습니까?')){		
		$("#edit_form").submit();
	}	
	return false;
})
</script>