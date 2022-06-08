document.addEventListener("DOMContentLoaded", function(){
	   document.getElementById('top').style.display = "none";
	   document.getElementById('bottom').style.display = "none";
	   document.getElementById('adminBottom').style.display ="block";

});// DOM loaded

// 페이징 처리
function move(p){
	location.href="/admin/allMemberList?currentPage="+p+""
}
 
// 관리자버튼 클릭 시 내용 표시
function memberAdmin(userNum){
	$("#editModal").show();
	let putuserNum = $("#modalUserNum").val(userNum);
		
	$.ajax({
		url:"/admin/memberAdmin",
		data:"userNum="+userNum,
		success:function(result){
			if(result==0){
				$("#updateAdminCancel").prop("checked", true);
				$("#updateAdmin").prop("checked", false);
				putuserNum;
			}else{
				$("#updateAdmin").prop("checked", true);
				$("#updateAdminCancel").prop("checked", false);
				putuserNum;
			}
		}
	});
}

// 회원정지 버튼 클릭 시 내용 표시
function memberBlock(userNum){
	$("#blockModal").show();
	let putuserNum = $("#modalUserNum").val(userNum);
	
	$.ajax({
		url:"/admin/memberAdmin",
		data:"userNum="+userNum,
		success:function(result){
			if(result==0){
				$("#blockMemberCancel").prop("checked", true);
				$("#blockMember").prop("checked", false);
				putuserNum;
			}else{
				$("#blockMember").prop("checked", true);
				$("#blockMemberCancel").prop("checked", false);
				putuserNum;
			}
		}
	})
}

// 관리자 모달 창 수정버튼 클릭 시 update
$(document).on("click", "#modalUpdate" , function(event){
	event.preventDefault();

	$.ajax({
		url:"/admin/updateAdmin",
		data:$(".modalBody").serialize(),
		success:function(){
			alert("관리자 권한 설정이 변경되었습니다.");
			$("#editModal").hide();
			location.href="/admin/allMemberList";
		}
	})
})

// 회원정지 모달 창 수정버튼 클릭 시 update
$(document).on("click", "#modalBlock" , function(event){
	event.preventDefault();

	$.ajax({
		url:"/admin/updateAdmin",
		data:$(".modalBody").serialize(),
		success:function(){
			alert("회원 정지 설정이 변경되었습니다.");
			$("#blockModal").hide();
			location.href="/admin/allMemberList";
		}
	})
})
