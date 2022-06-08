document.addEventListener("DOMContentLoaded", function(){
	   document.getElementById('top').style.display = "none";
	   document.getElementById('bottom').style.display = "none";
	   document.getElementById('adminBottom').style.display ="block";

});// DOM loaded

// 페이징 처리
 function move(p){
	console.log(p)
	location.href="/admin/allMemberList?currentPage="+p+""
 }
 
// 수정버튼 클릭 시 수정 내용 표시
function memberEdit(userNum,status){
	$("#editModal").show();

	$.ajax({
		url:"/admin/memberAdmin",
		data:"userNum="+userNum,
		success:function(result){
			if(result==0){
				$("#updateAdminCancel").prop("checked", true);
				$("#updateAdmin").prop("checked", false);
			}else{
				$("#updateAdmin").prop("checked", true);
				$("#updateAdminCancel").prop("checked", false);
			}
		}
	});
}

// 모달 창 수정버튼 클릭 시 update
$(document).on("click", "#modalUpdate" , function(event){
	event.preventDefault();

		$.ajax({
			url:"/admin/updateAdmin",
			data:$(".modalBody").serialize(),
			success:function(){
				alert("해당 회원에게 관리자 권한이 부여되었습니다.")
			}
		})

})

