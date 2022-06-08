<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/board.css" type="text/css">

<script>
/* ====== 글 등록하기 ======*/
function boardSend(){
	event.preventDefault();
<<<<<<< HEAD
	if($("#freeLogContent").val()==""){ // 글 입력 안함
		alert("글을 입력 후에 등록해주세요");
	}else{ // 글 입력
		var url = '/boardWrite';
		var data = $("#boardForm").serialize(); // form데이터 보내기
		$.ajax({
			url :url,
			data : data,
			type : 'POST',
			success : function(result){
				$("#log_list_div").empty();
				$("#freeLogContent").val("");
				console.log(${userNum});
				startNum=0;
				logLists();
			},error : function(e){
				alert("오류!");
			}
		});
=======
	if($("#loginNum").val()==""){//로그인 안됨
		alert("로그인 후 이용하세요");
		location.href = "/member/login";
	}else{
		if($("#freeLogContent").val()==""){ // 글 입력 안함
			alert("글을 입력 후에 등록해주세요");
		}else{ // 글 입력
			var url = '/boardWrite';
			var data = $("#boardForm").serialize(); // form데이터 보내기
			$.ajax({
				url :url,
				data : data,
				type : 'POST',
				success : function(result){
					$("#log_list_div").empty();
					$("#freeLogContent").val("");
					startNum=0;
					logLists();
				},error : function(e){
					alert("오류!");
				}
			});
		}
>>>>>>> da847a23b8dc229bf7094172075923117434f263
	}
}

/* ===== 글 삭제하기 ===== */
$(document).on('click', ".fa-xmark", function(){
	if(confirm('글을 삭제하시겠어요?')){
		let data = "boardNum="+$(this).attr("name");
		console.log(data);
		$.ajax({
			url:'/board/delOk',
			data:data,
			success:function(){
				$("#log_list_div").empty();
				startNum=0;
				logLists();
				alert('삭제되었습니다');
			},error:function(){
				console.log('삭제에러');
			}
		});
	}
});

/* ====== 보드 리스트 추가 ====== */
var startNum=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var dataLength=0; //이전에 불러온 데이터길이(무한 재귀 방지용)
var newOrLike=0;
 
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
				tag += "<div id='freeLog_div'>";		    	  
		    	tag += "<div id='info'><span id='infoLeft'><img src='"+data[i].profileImg+"' id='profileImg'/>&nbsp;&nbsp;"+ data[i].userNick +"("+ data[i].ip +")" +"</span>";
		    	tag += "<span id='infoRight'>"+ data[i].writedate +"&nbsp;&nbsp;&nbsp;&nbsp;";
<<<<<<< HEAD

		    	if(data[i].userNum == ${userInfo.userNum}){

=======
		    	if(data[i].userNum == $("#loginNum").val()){
>>>>>>> da847a23b8dc229bf7094172075923117434f263
					tag += "<i class='fa-solid fa-xmark' name= '" + data[i].boardNum + "' ></i>";
				}
		    	tag += "</span></div><hr/>";
		    	tag += "<div id='mainContent'>"+data[i].boardContent+"</div>";
				tag += "</div>";
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
						logLists(); //한번 더 실행
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
    window.scrollTo({top:0, behavior:'auto'});
}

/*======광고 무한슬라이드=============*/
$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 5000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

</script>
<section id="freeLogContainer">
	<p id="freeLogTitle">자유일기</p><input type="hidden" id="loginNum" value="${userInfo.userNum }"/>
	<!-- ====== 글 작성 하는곳 ======  -->
	<form id="boardForm">
		<textarea name="boardContent" id="freeLogContent" placeholder="자유 여행 일기 (100글자 한도)"></textarea>
		<c:if test="${userNick == null }">
			<button type="button" id="boardInsert" onclick="boardSend()">등록</button>
		</c:if>
		<%-- <c:if test="${userNick == null }">
			<input type="button" id="boardInsert" value="글 등록"
				onclick="alert('로그인 해야 이용가능합니다.')" />
		</c:if> --%>
	</form>
	<br><br><br>
	<!-- ====== 광고 슬라이드 ======= -->
	<div class="slideshow-container">
		<div class="mySlideDiv face active"><a href="https://www.hanatour.com/" target="_blank"><img src="/img/ad/ad1.jpg"></a></div>
		<div class="mySlideDiv face"><a href="http://www.palmfair.co.kr/main_20220611.asp?path=keyword&n=" target="_blank"><img src="/img/ad/ad2.jpg"></a></div>
		<div class="mySlideDiv face"><a href="https://www.redcap.co.kr/page/CM_IR_0220?pgNm=MAIN" target="_blank"><img src="/img/ad/ad3.jpg"></a></div>
	</div>
<!--====================================== HTML ===================================================================-->

<!-- log리스트 -->
<div id='log_list_div'></div>

<!-- 탑으로 가는 버튼 -->
<button id='top_btn' type="button" onclick='goTop()'><i class="fa-solid fa-angles-up"></i></button>

<!-- 로딩중 이미지 -->
<img src='/img/loading.gif' id='loading' style='height:300px; display:none;'/>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<!-- 상세페이지 -->
<div id='detail_div'></div>
</section>