<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/board.css" type="text/css">
<br>
<!-- ====== 글 작성 하는곳 ======  -->
<form method="post" id="boardForm" action="test" onsubmit="return boardSend()">
<textarea name="boardContent" id="content" placeholder="100글자 한도"></textarea>
<br>
	<c:if test="${userNick == null }">
		<input type="submit" id="boardInsert" value="글 등록" />
	</c:if>
	<%-- <c:if test="${userNick == null }">
		<input type="button" id="boardInsert" value="글 등록"
			onclick="alert('로그인 해야 이용가능합니다.')" />
	</c:if> --%>
<br>
</form>
<br><br><br>
<hr/>
<script>
/* ====== 글 등록하기 ======*/
function boardSend(){
	event.preventDefault();
	if($("#content").val()==""){ // 글 입력 안함
		alert("글을 입력 후에 등록해주세요2");
	}else{ // 글 입력
		var url = '/boardWrite';
		var data = $("#boardForm").serialize(); // form데이터 보내기
		$.ajax({
			url :url,
			data : data,
			type : 'POST',
			success : function(result){
				$("#log_list_div").empty();
				startNum=0;
				logLists();
			},error : function(e){
				console.log(content);
				alert("오류!");
			}
		});
	}
}
</script>

<script>		
var startNum=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var dataLength=0; //이전에 불러온 데이터길이(무한 재귀 방지용)
var newOrLike=0;

/* ====== 보드 리스트 추가 ====== */
	function logLists(){
		var url = '/boardList';
		var param = {"startNum" : startNum};
		console.log(param);
		$.ajax({
			url : url,
			data :param,
			type : 'GET',
			success : function(data){
				console.log("data.length : "+data.length);
				var tag = "";
				for(i=0; i<data.length; i++){
			    	  tag += "<ul id='log_ul' onclick='logDetail("+data[i].tNum+")'>";		    	  
			    	  tag += "<li id='info'>"+ data[i].userNick +"("+ data[i].ip  +")"+ "&nbsp;"+ data[i].writedate +"&nbsp;"+"</li>";
			    	  tag += "<li id='maincon'>"+data[i].boardContent+"</li>";
					  tag += "</ul>";
					  tag += "<br>";
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

/* ======= 부드럽게 위로 가기 ====== */
function goTop() {
    window.scrollTo({top:0, behavior:'smooth'});
}
</script>
<!--====================================== HTML ===================================================================-->

<!-- log리스트 -->
<div id='log_list_div'></div>

<!-- 탑으로 가는 버튼 -->
<button id='top_btn' onclick='goTop()'>Top ^^^^^</button>

<!-- 로딩중 이미지 -->
<img src='/img/loading.gif' id='loading' style='height:300px; display:none;'/>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<!-- 상세페이지 -->
<div id='detail_div'></div>
