<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>		
var startNum=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var dataLength=0; //이전에 불러온 데이터길이(무한 재귀 방지용)
var newOrLike=0;

/* ====== 로그 리스트 추가 ====== */
	function logLists(){
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1,7); //url 마지막/다음부분
		if(pn=='logList'){
			url = '/logShare/logLists';
			param = {
				"startNum" : startNum,
				"newOrLike" : newOrLike
			};
		}else if(pn='searchs'){
			url = '/logShare/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word,
				"newOrLike" : newOrLike
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
			    	  tag += "<li><img src='/upload/log/"+data[i].coverImg+"' width='300px'/></li>";
			    	  tag += "<li>"+data[i].tTitle+"</li>";
			    	  tag += "<li>"+data[i].startDate+"</li>";
			    	  tag += "<li>"+data[i].endDate+"</li>";
			    	  tag += "<li>"+data[i].likeNum+"</li>";
			    	  tag += "<li onclick=\"location.href='/member/profile?userNum="+data[i].userNum+"'\">";
			    	  tag += "<img src='/upload/user/"+data[i].profileImg+"' style=\"height:30px\"/>"+data[i].userNick + "</li>";
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
			    
			    //마지막 페이지일 때 첫페이지로
				if(data.length<5){
					startNum=0;
					if(dataLength!=0 && data.length==0){ //전체데이터가 0개가 아니고 현재 0개 불러와졌을때 스크롤이벤트가 없으므로 
						logList(); //한번 더 실행
					}
				} 
				dataLength = data.length;
				
			}//success
		});//ajax
 	}
	
/* ======== 스크롤 바닥 감지 ======== */
window.onscroll = function(e) {
    if($(window).scrollTop()+200>=$(document).height() - $(window).height()){
    	console.log("바닥");
    	if(!isFetching){
    		isFetching=true;
    		$("#loading").css("display","block");
    		console.log(isFetching);
    		logLists(); // 콘텐츠 추가
    	}
    }
};

//첫페이지 보이기
logLists(); 

$(document).ready(function(){
	/* ======== 최신순 정렬 ======== */
	$("#view_new").click(function(){
		newOrLike=0;
		$("#log_list_div").empty();
		startNum=0;
		logLists();
	});
	/* ======= 좋아요순 정렬 ======= */
	$("#view_like").click(function(){
		newOrLike=1;
		$("#log_list_div").empty();
		startNum=0;
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
	if('${searchKey}'!=null && '${searchKey}'!=""){
		document.getElementById("searchKey").value = '${searchKey}';
	}
	if('${searchWord}'!=null && '${searchWord}'!=""){
		document.getElementById("searchWord").value = '${searchWord}';
	}
}

/* ========== 검색 ========== */
$("#searchFrm").submit(function() {
	if ($("#searchWord").val() == "") {
	   alert("검색어를 입력하세요");
	   return false;
	}
});

/* === 올라가는 버튼 보이는 이벤트 === (에러있음!!)
function scrollFunction() {
    var btn = document.getElementById('top_btn');
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        btn.style.display = "block";
    } else {
        btn.style.display = "none";
    }
} */

/* ======= 부드럽게 위로 가기 ====== */
function goTop() {
    window.scrollTo({top:0, behavior:'smooth'});
}
</script>
<!-- ===================================== CSS ================================================================== -->
<style>
/* ===== 태그 ===== */
.tags{
	border-radius: 5px;
	padding: 5px;
	font-size:11px;
}
/* ===== 태그 색상(변경해야됨!) ===== */
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
<!--====================================== HTML ===================================================================-->
<div id="logListContainer">
<!-- 검색 -->
<section id="logListTop">
<div id="btnArea">
<button class="logListBtn" id='view_all' onclick="location.href='/logShare/logList'">전체 글 보기</button>&nbsp;
<button class="logListBtn" id='view_new'>New</button>&nbsp;
<button class="logListBtn" id='view_like'>Like</button>
</div>
<div id="searchFrm">
	<form action="/logShare/logList/searchs" id="searchFrm">
        <select name="searchKey" id='searchKey'>
            <option value="title">제목</option>
            <option value="tag">태그</option>
            <option value="userNick">작성자</option>
        </select>&nbsp;
        <input type="text" name="searchWord" id="searchWord"/>&nbsp;
        <input class="logListBtn" type="submit" value="검색"/>
    </form>
</div>
</section>
<br/>
<br/>
<br/>
<!-- log리스트 -->
<div id='log_list_div'></div>
<!-- 탑으로 가는 버튼 -->
<button class="logListBtn" id='top_btn' onclick='goTop()'><i class="fa-solid fa-angles-up"></i></button>
<!-- 로딩중 이미지 -->
<img src='/img/loading.gif' id='loading' style='height:300px; display:none;'/>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<!-- 상세페이지 -->
<div id='detail_div'></div>
</div>