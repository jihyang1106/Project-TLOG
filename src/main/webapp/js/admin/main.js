document.addEventListener("DOMContentLoaded", function(){
	   document.getElementById('top').style.display = "none";
	   document.getElementById('bottom').style.display = "none";
	   document.getElementById('adminBottom').style.display ="block";
	
	   tlogList();
	   boardList();
	   
	   // 지역별 통계
	   var tagList = []; 
	   var tagCountList = [];
	   // 나이별 통계
	   var tagListAge = [];
	   var tagCountListAge = [];
	   // 인원별 통계
	   var tagListGroup = [];
	   var tagCountListGroup =[];
	   // 계절별 통계 
	   var tagListSeason = [];
	   var tagCountListSeason = [];


	   // 지역별 통계
	   for(i=3; i<15; i++){
			var tags = document.getElementById("tags"+i).value;
			var tagCount = document.getElementById("tags"+i).getAttribute("name");
			tagList.push(tags);
			tagCountList.push(tagCount);
	   }
	   
	   // 나이별 통계
	   for(i=15; i<21; i++){
			var tags = document.getElementById("tags"+i).value;
			var tagCount = document.getElementById("tags"+i).getAttribute("name");
			tagListAge.push(tags);
			tagCountListAge.push(tagCount);
	   }
	   
	   // 인원별 통계
	   for(i=21; i<26; i++){
			var tags = document.getElementById("tags"+i).value;
			var tagCount = document.getElementById("tags"+i).getAttribute("name");
			tagListGroup.push(tags);
			tagCountListGroup.push(tagCount);
	   }
	   
	   // 계절별 통계
	   for(i=26; i<30; i++){
			var tags = document.getElementById("tags"+i).value;
			var tagCount = document.getElementById("tags"+i).getAttribute("name");
			tagListSeason.push(tags);
			tagCountListSeason.push(tagCount);
	   }
	   
	   
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
		
		// 태그 게시판 지역별 통계
	   new Chart('tagChart', {
		    type: 'bar', 
		    responsive: false,
		    data: {
		        labels: tagList ,
		        datasets: [{
					label : "지역",
		            backgroundColor: ["#E7E0C9", "#C1CFC0", "#6B7AA1", "#11324D", 
		            				  "#F4EEFF", "#DCD6F7","#7E94BF", "#5357A6",
		            				  "#FFE6E6", "#F2D1D1", "#DAEAF1", "#C6DCE4"],
		      		data : tagCountList
		        }]
		    },
		    options: {
				plugins:{ // 라벨 숨기기
                        legend: {
                            display: false
                        },
                 },
				responsive: false,
			}
		});
		
		// 태그 게시판 나이별 통계
	   new Chart('tagChartAge', {
		    type: 'bar', 
		    responsive: false,
		    data: {
		        labels: tagListAge ,
		        datasets: [{
					label : "나이",
		            backgroundColor: [
		          	  "#7E94BF", "#5357A6", "#FFE6E6", "#F2D1D1", "#DAEAF1", "#C6DCE4"],
		      		data : tagCountListAge
		        }]
		    },
		    options: {
				plugins:{ // 라벨 숨기기
                        legend: {
                            display: false
                        },
                 },
				responsive: false,
			}
		});
		
		// 태그 게시판 인원별 통계
	   new Chart('tagChartGroup', {
		    type: 'bar', 
		    responsive: false,
		    data: {
		        labels: tagListGroup ,
		        datasets: [{
					label : "인원",
		            backgroundColor: [
		          	 "#7E94BF", "#5357A6", "#FFE6E6", "#F2D1D1", "#DAEAF1", "#C6DCE4"],
		      		data : tagCountListGroup
		        }]
		    },
		    options: {
				plugins:{ // 라벨 숨기기
                        legend: {
                            display: false
                        },
                 },
				responsive: false,
			}
		});
		
		// 태그 게시판 계절별 통계
	   new Chart('tagChartSeason', {
		    type: 'bar', 
		    responsive: false,
		    data: {
		        labels: tagListSeason ,
		        datasets: [{
					label : "계절",
		            backgroundColor: [
		          	 "#FFE6E6", "#F2D1D1", "#DAEAF1", "#C6DCE4"],
		      		data : tagCountListSeason
		        }]
		    },
		    options: {
				plugins:{ // 라벨 숨기기
                        legend: {
                            display: false
                        },
                 },
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

	// 여행일기 글 삭제
	function delTlog(tNum){
		if(confirm("글을 삭제하시겠어요?")){
			$.ajax({
				url:"/admin/delTlog",
				data:"tNum="+tNum,
				success:function(){
					alert('글이 성공적으로 삭제되었습니다.')
					tlogList();
				}
			});
		};
	}
	
	// 자유일기 글 삭제
	function delBoard(boardNum){
		if(confirm("글을 삭제하시겠어요?")){
			$.ajax({
				url:"/admin/delBoard",
				data:"boardNum="+boardNum,
				success:function(){
					alert('글이 성공적으로 삭제되었습니다.')
					boardList();
				}
			});
		};
	}
   
	// 여행일기 리스트
	function ajaxTlog(result){

		var body = "<thead><tr><th>여행일기 번호</th>"
		body += "<th>제목</th><th>글 작성일자</th>"
		body += "<th>닉네임</th><th>삭제</th></tr></thead><tbody>"
		$.each(result.tlogList, function(idx, vo){
			body += "<tr><td>"+vo.tNum+"</td>"
			body += "<td>"+vo.tTitle+"</td>"
			body += "<td>"+vo.writeDate+"</td>"
			body += "<td>"+vo.userNick+"</td>"
			body += "<td><input type='button' class='btn delBtn tlogDel' value='삭제'"
			body += "onclick='delTlog("+vo.tNum+");'></td></tr>"
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
		
		var body = "<thead><tr><th>자유일기 번호</th>"
		body += "<th>내용</th><th>글 작성일자</th>"
		body += "<th>닉네임</th><th>삭제</th></tr></thead><tbody>"
		$.each(result.boardList, function(idx, vo){
			body += "<tr><td>"+vo.boardNum+"</td>"
			body += "<td>"+vo.boardContent+"</td>"
			body += "<td>"+vo.writedate+"</td>"
			body += "<td>"+vo.userNick+"</td>"
			body += "<td><input type='button' class='btn delBtn boardDel' value='삭제'"
			body += "onclick='delBoard("+vo.boardNum+");'></td></tr>"
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
