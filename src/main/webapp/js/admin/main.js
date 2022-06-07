document.addEventListener("DOMContentLoaded", function(){
	   document.getElementById('top').style.display = "none";
	   document.getElementById('bottom').style.display = "none";
	   document.getElementById('adminBottom').style.display ="block";
	
	   tlogList();
	   boardList();
	   
	   var tagList = []; 
	   
	   // 전체 게시판 통계
	   new Chart('myChart', {
		    type: 'doughnut', 
		    responsive: false,
		    data: {
		        labels: ['여행일기','자유일기'],
		        datasets: [{
		            backgroundColor: ["#DBDFFD", "#DAEAF1"],
		            data: [ document.getElementById("tlogTotal").value,
		            		document.getElementById("boardTotal").value ]
		        }]
		    },
		    options: {
				responsive: false,
			}
		});
		
		// 태그 게시판 통계
	   new Chart('tagChart', {
		    type: 'doughnut', 
		    responsive: false,
		    data: {
		        labels: [],
		        datasets: [{
		            backgroundColor: ["#DBDFFD", "#DAEAF1"],
		            data: [ 15, 66, 45 ]
		        }]
		    },
		    options: {
				responsive: false,
			}
		});
		
		
});// DOM loaded

	// 페이지가 로딩되면 여행일기 리스트 보여주기
   function tlogList(){
		$.ajax({
			url:"/admin/tlog",
			success:function(result){
				ajaxTlog(result);
			}
		})
   }
   
   	// 페이지가 로딩되면 자유일기 리스트 보여주기
   function boardList(){
		$.ajax({
			url:"/admin/board",
			success:function(result){
				ajaxBoard(result);
			}
		})
   }
   
   	// 여행일기 페이징 처리
	$(document).on("click", ".tlog", function() {
		var p = $(this).val();
		let url="/admin/tlog?currentPage="+p+""
		$.ajax({
			url:url,
			success:function(result){
				ajaxTlog(result);
			}
		})
	})
   
     // 자유일기 페이징 처리
	$(document).on("click", ".board", function() {
		var p = $(this).val();
		let url="/admin/board?currentPage="+p+""
		$.ajax({
			url:url,
			success:function(result){
				ajaxBoard(result);
			}
		})
	})
   
	// 여행일기 리스트
	function ajaxTlog(result){

		var body = "<thead><tr><th>travelLog.No</th>"
		body += "<th>Title</th><th>Date</th>"
		body += "<th>Nickname</th><th>삭제</th></tr></thead><tbody>"
		$.each(result.tlogList, function(idx, vo){
			body += "<tr><td>"+vo.tNum+"</td>"
			body += "<td>"+vo.tTitle+"</td>"
			body += "<td>"+vo.writeDate+"</td>"
			body += "<td>"+vo.userNick+"</td>"
			body += "<td><input type='button' class='btn delBtn' value='삭제'"
			body += "onclick='del("+vo.tNum+");'></td></tr>"
		})
		body += "</tbody></table>"
		$("#dataTable").html(body);
		
		let pVO = result.paging;
	
		body = "<ul class='pagination justify-content-center'>";
		
		// 이전페이지
		if(pVO.currentPage>1){
			body += "<li class='page-item tlog' value='"+(pVO.currentPage-1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-left'></i></a></li>"
		}
		// 현재페이지
		for(i=1; i<=pVO.totalPages; i++){
			if(i<=pVO.totalPages){
				if(i==pVO.currentPage){
					body += "<li class='page-item disabled'><a class='page-link'>"+i+"</a></li>"
				}else{
					body += "<li class='page-item tlog'value='"+i+"' ><a class='page-link' href='javascript:void(0);' >"
					body += i+"</a></li>"
				}
			}
		}
		// 다음페이지
		if(pVO.currentPage<pVO.totalPages){
			body += "<li class='page-item tlog' value='"+(pVO.currentPage+1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-right'></i></a></li>"
		}
		body +="</ul>"
		$("#dataTable_info").html(body);
	}
	
	// 자유일기 리스트
	function ajaxBoard(result){
		
		var body = "<thead><tr><th>Board.No</th>"
		body += "<th>Content</th><th>Date</th>"
		body += "<th>Nickname</th><th>삭제</th></tr></thead><tbody>"
		$.each(result.boardList, function(idx, vo){
			body += "<tr><td>"+vo.boardNum+"</td>"
			body += "<td>"+vo.boardContent+"</td>"
			body += "<td>"+vo.writedate+"</td>"
			body += "<td>"+vo.userNick+"</td>"
			body += "<td><input type='button' class='btn delBtn' value='삭제'"
			body += "onclick='del("+vo.boardNum+");'></td></tr>"
		})
		body += "</tbody></table>"
		$("#boardTable").html(body);
		
		// 페이징
		let pVO = result.paging;
		body = "<ul class='pagination justify-content-center'>";
		
		// 이전페이지
		if(pVO.currentPage>1){
			body += "<li class='page-item board' value='"+(pVO.currentPage-1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-left'></i></a></li>"
		}
		// 현재페이지
		for(i=1; i<=pVO.totalPages; i++){
			if(i<=pVO.totalPages){
				if(i==pVO.currentPage){
					body += "<li class='page-item disabled'><a class='page-link'>"+i+"</a></li>"
				}else{
					body += "<li class='page-item board' value='"+i+"'><a class='page-link' href='javascript:void(0);' >"
					body += i+"</a></li>"
				}
			}
		}
		// 다음페이지
		if(pVO.currentPage<pVO.totalPages){
			body += "<li class='page-item board' value='"+(pVO.currentPage+1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-right'></i></a></li>"
		}
		body +="</ul>"
		$("#boardTable_info").html(body);
	}


	
$(function(){


});
