document.addEventListener("DOMContentLoaded", function(){
	   document.getElementById('top').style.display = "none";
	   document.getElementById('bottom').style.display = "none";
	   document.getElementById('adminBottom').style.display ="block";
	
	   tlogList();
	   
	   // 전체 게시판 통계
	   new Chart('myChart', {
		    type: 'doughnut', 
		    responsive: false,
		    data: {
		        labels: ['여행일기','자유일기'],
		        datasets: [{
		            label: '일기',
		            backgroundColor: ["#DBDFFD", "#DAEAF1"],
		            data: [ document.getElementById("tlogTotal").value,
		            		document.getElementById("boardTotal").value ]
		        }]
		    },
		    options: {
				responsive: false,
			}
		});
		
});// DOM loaded

	// 페이지가 로딩되면 리스트 보여주기
   function tlogList(){
		$.ajax({
			url:"/admin/tlog",
			success:function(result){
				ajaxTlog(result)
			}
		})
   }
   
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
	
		body = "<ul class='pagination justify-content-center' id='paging'>";
		
		// 이전페이지
		if(pVO.currentPage>1){
			body += "<li class='page-item' value='"+(pVO.currentPage-1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-left'></i></a></li>"
		}
		
		// 현재페이지
		for(i=1; i<=pVO.totalPages; i++){
			if(i<=pVO.totalPages){
				if(i==pVO.currentPage){
					body += "<li class='page-item disabled'><a class='page-link'>"+i+"</a></li>"
				}else{
					body += "<li class='page-item'value='"+i+"' ><a class='page-link' href='javascript:void(0);' >"
					body += i+"</a></li>"
				}
			}
		}
		
		// 다음페이지
		if(pVO.currentPage<pVO.totalPages){
			body += "<li class='page-item' value='"+(pVO.currentPage+1)+"'><a class='page-link' href='javascript:void(0);' >"
			body += "<i class='fa fa-angle-right'></i></a></li>"
		}
	
		body +="</ul>"
		$("#dataTable_info").html(body);
	}


	 // 페이징 처리
	$(document).on("click", ".page-item", function() {
		var p = $(this).val();
		let url="/admin/tlog?currentPage="+p+""
		$.ajax({
			url:url,
			success:function(result){
				ajaxTlog(result);
			}
		})
	})
$(function(){


});
