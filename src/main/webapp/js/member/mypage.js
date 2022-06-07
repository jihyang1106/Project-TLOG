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
	var url='/mypage';
	if(tab=='tab1'){
		url+='/member/userEdit'
		console.log("확인1")
	}else if (tab=='tab2'){
		url+='/member/myLog'
		console.log("확인2")
	}else if (tab=='tab3'){
		url+='/member/myfollow'
		console.log("확인3")
	}		
	
	$.ajax({
		url:url,
		dataType:'json',
		success:function(dataArr){
			if(tab=='tab1'){
				/*alert("회원정보수정")*/
				showUserEdit(dataArr, tab)
			}else if (tab=='tab2'){
				/*alert("내가쓴e글")*/
				showMyLog(dataArr, tab)
			}else if (tab=='tab3'){
				/*alert("팔로우")*/
				showFollow(dataArr, tab)
			}
		}			
	})
}
function showUserEdit(dataArr, tab){
	var str="";
	str+="<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>";
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