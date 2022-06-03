//나의 일기 관련 변수 선언
var status=0; //현재(나의 여행일기 리스트)
var startNum=0;
var isFetching = false; //로딩 시 true(중복실행 방지)
var isFinished = 0; //무한스크롤 이벤트 막기

//ajax로 일기 리스트 데이터 받아오기
function logLists(){
	var url='/member/profileLogList';
	var param;
	const params = new URL(window.location.href).searchParams;
	var userNum = params.get('userNum');
	/*var searchStart = params.get('searchStart');
	var searchEnd = params.get('searchEnd');*/
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1,7); //url 마지막'/'다음9글자
	console.log(pn)
	param = {
			"startNum" : startNum,
			"status" : status,
			"userNum" : 2
		};
	/*if(pn=='profile'){
		url = '/member/profileLogList';
		param = {
			"startNum" : startNum,
			"status" : status,
			"userNum" : userNum
		};
	}else if(pn='searchA'){
		url = '/member/searchAtProfileLogList';
		param = {
			"startNum" : startNum ,
			"status" : status,
			"userNum" : userNum,
			"searchStart" : searchStart,
			"searchEnd" : searchEnd
		};
		
	}*/
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
				tag += "<div class='log_div'>"
				tag += "<ul class='log_ul' onclick='logDetail("+data[i].tNum+")'>";
				tag += "<li><img src='/img/log/"+data[i].coverImg+"' class='coverImg'/></li>";
				tag += "<li class='profileInfo'><span><img src='/img/member/"+data[i].profileImg+".png' class='logProfileImg''/></span>&emsp;";
				tag += "<span class='logNick'>"+data[i].userNick+"</span>";
				tag += "<span class='logLike'><i class='fa-solid fa-thumbs-up'></i>&emsp;"+data[i].likeNum+"</span></li><hr/>";
				tag += "<li>";
				if(data[i].isPrivate==1){
					tag += "<span><i class='fa-solid fa-lock'></i></span>&emsp;";
				}
				tag += "<span class='logTitle'>"+data[i].tTitle+"</span>";
				tag += "</li>";
				tag += "<li><span>"+data[i].startDate+"</span>&nbsp;~&nbsp;<span>"+data[i].endDate+"</span></li>";
				
				tag += "<li>";
				for(j=0; j<data[i].tagList.length; j++){
					tag += "<span class='tags' id='tag"+data[i].tagList[j].tagNum+"'";
					tag += "onclick=\"location.href='/logShare/logList/searchs?searchKey=tag&searchWord="+data[i].tagList[j].tagName+"'\">";
					tag += data[i].tagList[j].tagName+"</span>&nbsp;";
				}
				tag += "</li></ul></div>";
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

//나의 여행일기, 태그된 글, 좋아요를 ajax로 띄우기 위한 함수
$(document).ready(function(){
	/* ======== 나의 여행일기 ======== */
	$("#tab1").click(function(){
		$("#log_list_div").empty()
    	$('ul#tab li').removeClass('current');//css
    	$('.tabcontent').removeClass('current');//css
        $(this).addClass('current');//현재 선택된 탭 css 지정
		status=0;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();//data 받아오기 및 setting
	});
	/* ========== 태그된 글 ========== */
	$("#tab2").click(function(){
		$("#log_list_div").empty()
    	$('ul#tab li').removeClass('current');
    	$('.tabcontent').removeClass('current');
        $(this).addClass('current');
		status=1;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();
	});
	/* ========= 좋아요 누른 글 ========= */
	$("#tab3").click(function(){
		$("#log_list_div").empty()
    	$('ul#tab li').removeClass('current');
    	$('.tabcontent').removeClass('current');
        $(this).addClass('current');
		status=2;
		startNum=0;
		isFinished=0;
		isFetching=true;
		$("#loading").css("display","block"); //로딩이미지 표시
		logLists();
	});
})

//=================================================================
/*$(function(){
    ajaxsend('tab1');
    $('ul#tab li').click(function() {
        var activeTab = $(this).attr('id');
        $('ul#tab li').removeClass('current');
        $('.tabcontent').removeClass('current');
        $(this).addClass('current');
        $('#' + activeTab).addClass('current');
        ajaxsend(activeTab);
    });
});

function ajaxsend(tab){
    var url='/member';
    if(tab=='tab1'){
        url+='/myLog';
    }else if (tab=='tab2'){
        url+='/tagedLog';
    }else if (tab=='tab3'){
        url+='/pickLog';
    }        
    
    $.ajax({
        url:url,
        success:function(dataArr){
            if(tab=='tab1'){
				$("#myLog").empty();
                showMyLog(dataArr, tab);
            }else if (tab=='tab2'){
                showtagedLog(dataArr, tab)
            }else if (tab=='tab3'){
                showLike(dataArr, tab)
            }
        }            
    })
}
//ajax로 받아온 데이터 set
function showMyLog(dataArr, tab){
    var str="";
    str+="<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>";
    $("#myLog").html(str);
    $("#myLog").css('display','block');
    $("#tagedLog").css('display','none');
    $("#likeLog").css('display','none');
}
function showtagedLog(dataArr, tab){
    var str="";
    str+="<p>dhdhdhddhdh</p>";
    $("#tagedLog").html(str);
    $("#myLog").css('display','none');
    $("#tagedLog").css('display','block');
    $("#likeLog").css('display','none');
}
function showLike(dataArr, tab){
    var str="";
    str+="<p>fhfhhffhfh</p>";
    $("#likeLog").html(str);
    $("#myLog").css('display','none');
    $("#tagedLog").css('display','none');
    $("#likeLog").css('display','block');
}*/