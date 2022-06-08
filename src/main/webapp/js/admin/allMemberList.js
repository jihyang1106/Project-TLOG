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
 
 function showTlog(){
	alert('여행일기 눌렀어요!')
}
