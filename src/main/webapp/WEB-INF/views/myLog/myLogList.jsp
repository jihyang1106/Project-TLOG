<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var status=0; //현재(나의 여행일기 리스트)
var startNum=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var isFinished = 0; //무한스크롤 이벤트 막기

/* ====== 로그 리스트 추가(무한스크롤X) ====== */
	function logLists(){
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var userNum = params.get('userNum');
		var searchStart = params.get('searchStart');
		var searchEnd = params.get('searchEnd');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1,9); //url 마지막'/'다음9글자
		if(pn=='myLogList'){
			url = '/myLog/logLists';
			param = {
				"startNum" : startNum,
				"status" : status,
				"userNum" : userNum
			};
		}else if(pn='logSearch'){
			url = '/myLog/searchLists';
			param = {
				"startNum" : startNum ,
				"status" : status,
				"userNum" : userNum,
				"searchStart" : searchStart,
				"searchEnd" : searchEnd
			};
			
		}
		console.log(param);
		$.ajax({
			url : url,
			type : 'GET',
			dataType : 'json',
			data :param,
			success : function(data){
				console.log("data.length : "+data.length);
				var tag = "";
				for(i=0; i<data.length; i++){
			    	  tag += "<ul id='log_ul' onclick='logDetail("+data[i].tNum+")'>";
			    	  if(data[i].isPrivate==1){
			    		  tag += "<li><i class='fa-solid fa-lock'></i></li>";
			    	  }
			    	  tag += "<li>"+data[i].coverImg+"</li>";
			    	  tag += "<li>"+data[i].tTitle+"</li>";
			    	  tag += "<li>"+data[i].startDate+"</li>";
			    	  tag += "<li>"+data[i].endDate+"</li>";
			    	  tag += "<li>"+data[i].likeNum+"</li>";
			    	  tag += "<li>"+data[i].profileImg+"</li>";
			    	  tag += "<li>"+data[i].userNick+"</li>";
					  tag += "<li>";
					  for(j=0; j<data[i].tagList.length; j++){
						  tag += "<span class='tags' id='tag"+data[i].tagList[j].tagNum+"'";
						  tag += "onclick=\"location.href='/logShare/logList/searchs?searchKey=tag&searchWord="+data[i].tagList[j].tagName+"'\">";
						  tag += data[i].tagList[j].tagName+"</span>&nbsp;";
					  }
					  tag += "</li></ul>";
			    }//for
			    
			    $("#log_list_div").append(tag);
			    
			    isFetching=false; //로딩완료
			    console.log(isFetching);
			    $("#loading").css("display","none"); //로딩이미지 없애기
			    
			    startNum += data.length; //startNum 갱신
			    console.log("startNum > "+startNum);
			   
			    if(data.length<5){
			    	isFinished=1;
			    }
			}//success
		});//ajax
 	}
 	
//첫페이지 보이기
logLists(); 

/* ======== 스크롤 바닥 감지 ======== */
window.onscroll = function(e) {
    if(isFinished==0 && $(window).scrollTop()+200>=$(document).height() - $(window).height()){
    	console.log("바닥");
    	if(!isFetching){
    		isFetching=true;
    		$("#loading").css("display","block"); //로딩이미지 표시
    		console.log(isFetching);
    		logLists(); // 콘텐츠 추가
    	}
    }
};

$(document).ready(function(){
	/* ======== 나의 여행일기 ======== */
	$("#view_mine").click(function(){
		$("#log_list_div").empty();
		status=0;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();
	});
	/* ========== 태그된 글 ========== */
	$("#view_tagged").click(function(){
		$("#log_list_div").empty();
		status=1;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();
	});
	/* ========= 좋아요 누른 글 ========= */
	$("#view_like").click(function(){
		$("#log_list_div").empty();
		status=2;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();
	});
})
/* === 클릭이벤트: 일기 상세 리스트 === */
function logDetail(tNum){
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
}
/* ===== 검색한 단어 띄우기 ===== */
window.onload = function(){
	if('${searchStart}'!=null && '${searchStart}'!=""){
		document.getElementById("searchStart").value = '${searchStart}';
	}
	if('${searchEnd}'!=null && '${searchEnd}'!=""){
		document.getElementById("searchEnd").value = '${searchEnd}';
	}
	if('${userNum}'!=null && '${userNum}'!=""){
		document.getElementById("userNum").value = '${userNum}';
	}
}

/* === 올라가는 버튼 보이는 이벤트 === (에러있음!!)*/
function scrollFunction() {
    var btn = document.getElementById('top_btn');
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        btn.style.display = "block";
    } else {
        btn.style.display = "none";
    }
}

/* ======= 부드럽게 위로 가기 ====== */
function goTop() {
    window.scrollTo({top:0, behavior:'smooth'});
}
</script>
<!-- ============================= HTML ============================================================================= -->
<!-- 검색 -->
<div>
	<form action="/myLog/myLogList/logSearch" id="searchFrm">
        <input type="date" name="searchStart" id="searchStart"/>
        <input type="date" name="searchEnd" id="searchEnd"/>
        <input type="hidden" name="userNum" id="userNum"/>
        <input type="submit" value="Search"/>
    </form>
    <button id='view_all' onclick="location.href='/myLog/myLogList?userNum=${userNum}'">전체 글 보기</button>
</div>
<button id='view_mine'>여행일기</button>
<button id='view_tagged'>태그된 글</button>
<button id='view_like'><i class="fa-solid fa-heart"></i></button>
<br/>

<!-- log리스트 -->
<div id='log_list_div'></div>
<!-- 탑으로 가는 버튼 -->
<button id='top_btn' onclick='goTop()' style='display:none'>Top ^^^^^</button>

<!-- 로딩중 이미지 -->
<img src='/img/loading.gif' id='loading' style='height:300px; display:none;'/>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<!-- 상세페이지 -->
<div id='detail_div'></div>