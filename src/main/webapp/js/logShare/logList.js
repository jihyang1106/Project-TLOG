var tNum=0;
var cursor=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var dataLength=0; //이전에 불러온 데이터길이(무한 재귀 방지용)
var newOrLike=0;

/* ====== 로그 리스트 추가 ====== */
	function logLists(){
		var url;
		var param;
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1,pathname.lastIndexOf('/')+8); //url 마지막/다음부분
		if(pn=='logList'){
			url = '/logShare/logLists';
			param = {
				"tNum" : tNum,
				"cursor" : cursor,
				"newOrLike" : newOrLike
			};
		}else if(pn='searchs'){
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			url = '/logShare/searchLists';
			param = {
				"tNum" : tNum ,
				"cursor" : cursor,
				"newOrLike" : newOrLike,
				"searchKey" : key,
				"searchWord" : word				
			};		
		}
		$.ajax({
			url : url,
			type : 'GET',
			dataType : 'json',
			data :param,
			success : function(data){
				var tag = "";
				for(i=0; i<data.length; i++){
					tag += "<div class='log_div'>"
					tag += "<ul class='log_ul' onclick=\"window.open('/logShare/logView?tNum="+data[i].tNum+"')\">";
					tag += "<li><img src='/upload/log/"+data[i].coverImg+"' class='coverImg'/></li>";
					tag += "<li class='profileInfo'><span onclick=\"location.href='/member/profile?userNum="+data[i].userNum+"'\"><img src='"+data[i].profileImg+"'' class='logProfileImg''/></span>&emsp;";
					tag += "<span class='logNick' onclick=\"location.href='/member/profile?userNum="+data[i].userNum+"'\">"+data[i].userNick+"</span>";
					tag += "<span class='logLike'><i class='fa-solid fa-thumbs-up'></i>&emsp;"+data[i].likeNum+"</span></li><hr/>";
					tag += "<li>";
					if(data[i].isPrivate==1){
						tag += "<span><i class='fa-solid fa-lock'></i></span>&emsp;";
					}
					tag += "<span class='logTitle'>"+data[i].tTitle+"</span>";
					tag += "</li>";
					tag += "<li><span>"+data[i].placeInfo+"</span></li>";
					tag += "<li><span>"+data[i].startDate+"</span>&nbsp;~&nbsp;<span>"+data[i].endDate+"</span></li>";
					tag += "<li>";
					for(j=0; j<data[i].tagList.length; j++){
						tag += "<span class='tags' id='tag"+data[i].tagList[j].tagNum+"'";
						tag += "onclick=\"location.href='/logShare/logList/searchs?searchKey=tag&searchWord="+data[i].tagList[j].tagName+"'\">";
						tag += data[i].tagList[j].tagName+"</span>&nbsp;&nbsp;";
					}
					tag += "</li></ul></div>";
					
					//마지막 데이터의 커서 저장
					if(i==data.length-1){
						if(newOrLike==0){//최신순
							tNum = data[i].tNum;
						}else{ //좋아요순
							cursor = data[i].cursor;
						}
					}
				}//for
			    $("#log_list_div").append(tag);
			    isFetching=false; //로딩완료
			    $("#loading").css("display","none"); //로딩이미지 없애기
			    
			    //마지막 페이지일 때 첫페이지로
				if(data.length<7){
					if(newOrLike==0){//최신순
						tNum = 0;
					}else{ //좋아요순
						cursor = 0;
					}
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
    if($(window).scrollTop()+500>=$(document).height() - $(window).height()){
    	if(!isFetching){
    		isFetching=true;
    		$("#loading").css("display","block");
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
		tNum=0;
		cursor=0;
		logLists();
	});
	/* ======= 좋아요순 정렬 ======= */
	$("#view_like").click(function(){
		newOrLike=1;
		$("#log_list_div").empty();
		tNum=0;
		cursor=0;
		logLists();
	});
})


/* ========== 검색 ========== */
$("#searchFrm").submit(function() {
	if ($("#searchWord").val() == "") {
	   alert("검색어를 입력하세요");
	   return false;
	}
});
$("#view_all").click(function(e){
	e.preventDefault();
})
/* ======= 부드럽게 위로 가기 ====== */
function goTop() {
    window.scrollTo({top:0, behavior:'smooth'});
}