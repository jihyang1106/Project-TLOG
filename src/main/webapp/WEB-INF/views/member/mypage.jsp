<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/mypage.css" type="text/css">
<!-- <script src="/js/member/mypage.js"></script> -->
<script>
$(function(){
	ajaxsend('tab1');
	$('ul#tab li').click(function() {
		var activeTab = $(this).attr('id');
		$('ul#tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
		ajaxsend(activeTab);
	});
});//jQuery
function ajaxsend(tab){
	var url='/member';
	if(tab=='tab1'){
		url+='/mypage/userEdit'
		console.log("확인1")
	}else if (tab=='tab2'){
		url+='/mypage/myLog'
		console.log("확인2")
	}else if (tab=='tab3'){
		url+='/mypage/myfollow'
		console.log("확인3")
	}		
	
	$.ajax({
		url:url,
		/* dataType:'json', */
		success:function(dataArr){
			console.log(dataArr);
			if(tab=='tab1'){
				/* alert("회원정보수정") */
				showUserEdit(dataArr, tab)
			}else if (tab=='tab2'){
				/*alert("내가쓴글")*/
				showMyLog(dataArr, tab)
			}else if (tab=='tab3'){
				/*alert("팔로우")*/
				showFollow(dataArr, tab)
			}
		}			
	})
}
function showUserEdit(dataArr, tab){
	var str= "";
	str+=dataArr.userNick+"<br/>";
	$("#userEdit").html(str);
}
function showMyWrite(dataArr, tab){
	var str="";
	str+="<p>dhdhdhddhdh</p>";
	$("#myLog").html(str);
}
function showFollow(dataArr, tab){
	var str="";
	str+="<p>fhfhhffhfh</p>";
	$("#myFollow").html(str);
}
</script>
<div id="mypageContainer">
	<div id="mypageSlideSection">
		<ul class="nav nav-tabs" id="tab">
			<li class="nav-item" id="tab1"><a class="nav-link active" data-toggle="tab" href="#userEdit">회원정보수정</a></li>		
			<li class="nav-item" id="tab2"><a class="nav-link" data-toggle="tab" href="#myLog">내가쓴 글 보기</a></li>		
			<li class="nav-item" id="tab3"><a class="nav-link" data-toggle="tab" href="#myFollow">팔로우한 사람</a></li>		
		</ul>
	</div>
	<div id="mypageContent">
		<div id="userEdit"></div>
		<div id="myLog"></div>
		<div id="myFollow"></div>
	</div>
</div>