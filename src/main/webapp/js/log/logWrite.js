/*================ 태그 선택 ==================*/
//.tags클릭 시 chk상태확인 후  css && chk 변화
$(".tags").click(function(){
	//체크된 상태일 때
	if($(this).next().is(":checked")){ 
		$(this).next().prop("checked", false);
		$(this).css("background-color", "#ddd");
	//체크된 상태 아닐 때
	}else{ 
		$(this).next().prop("checked", true);
		var id = $(this).attr('id');
		switch(id){
		case'tag1': case'tag2':
			$(this).css("background-color", "rgb(42, 76, 211, 70%)");
		break
		case'tag3': case'tag4': case'tag5': case'tag6': case'tag7':
			$(this).css("background-color", "rgba(122, 140, 226, 80%)");
		break
		case'tag8': case'tag9': case'tag10': case'tag11': case'tag12': case'tag13': case'tag14':
			$(this).css("background-color", "rgba(122, 140, 226, 30%)");
		break
		case'tag15': case'tag16': case'tag17': case'tag18': case'tag19': case'tag20':
			$(this).css("background-color", "#C3E2DD");
		break
		case'tag21': case'tag22': case'tag23': case'tag24': case'tag25':
			$(this).css("background-color", "#FEF5D4");
		break
		case'tag26': case'tag27': case'tag28': case'tag29':
			$(this).css("background-color", "#EACACB");
		break
		}
		
		
	}
})
/*================ 태그할 유저 선택 ==================*/
var cnt=0;
function PlusUser(){
	if(cnt<5){
		var li ="<li><input type='hidden' name='userNumList'/><input type='text' class='tag_box'/>&nbsp;&nbsp;<i class='fa-solid fa-xmark'></i>&nbsp;&nbsp;&nbsp;<ul class='search_user_ul'></ul></li>";
		$("#tag_user_ul").append(li);
		cnt++;
		console.log(cnt);
		if(cnt>=5){
			$("#plus").css("display","none"); //플러스버튼 지우기
		}
	}
}
//유저 박스 지우기
$(document).on("click", ".fa-xmark", function() {
	$(this).parent().remove();
	cnt--;
	console.log(cnt);
	if(cnt<5){
		$("#plus").css("display","block"); //플러스 버튼 보이기
	}
})
	//태그할 유저 자동검색
	$(document).on("keyup", ".tag_box", function() {
		if($(this).val().trim()!=""){
			var ul = $(this).next().next(); //유저리스트 들어갈 ul
			var data = {"userNick" : $(this).val()};
			//console.log(data);
			
			$.ajax({
		          url: '/myLog/searchUserList',
		          type: 'GET',
		          data: data,
		          success: function (data) {
		        	  var list = "";
		        	  for(var i=0; i<data.length; i++){
		        		  list += "<li class='search_user_li' value='"+data[i].userNum+"'>";
		        		  list += "<img src='/upload/user/"+data[i].profileImg+"' class='profile_img'/>&nbsp;"+data[i].userNick;
		        		  list += "</li>";
		        	  }
		        	  ul.html(list); //ul태그 안에 넣기
		        	  //console.log(list);
		        	  
		        		//검색된 유저 클릭 시====================================================================
		        		$(".search_user_li").on('click', function(){
							console.log("클릭");
		        			var userNum = $(this).val();
		        			var userNick = $(this).text();
		        			//console.log(userNum, userNick);
		        			$(this).parent().prev().prev().val(userNick); //inputText
		        			$(this).parent().prev().prev().prev().val(userNum); //inputHidden
		        			$(this).parent().empty(); //검색리스트 지우기
		        		})
		        		
		        		/*//포커스 넘어갔을 때 > 클릭 이벤트보다 먼저 실행됨(에러)
		        		$(".tag_box").blur(function(){
		        			$(this).next().next().empty(); //검색리스트 지우기
		        		})*/
		          },
		          error: function (e) {
			            alert("error = "+ e.responseText);
			      }
			   })
		}		
	});
	
		
//div 클릭 시 파일 업로드 진행
$(".log_img_top").click(function() {
 $(this).next().trigger("click");
})

//이미지 미리보기
$(document).on("change", '.log_img', function() {
	$("#detail_div").empty(); //이미지 미리보기 div 비우기
	readImage(this);
});

function readImage(input){
	if (input.files) { //input 태그에 파일이 있을 경우
		
		//forEach 사용을 위해 files를 배열화(files는 forEach 사용 불가);
		const fArr = Array.from(input.files);
		
		fArr.forEach(function(file, index) {
			//10개를 초과하여 이미지 선택시 초과분에 대해서는 작업하지 않음
			if (index > 10) {
				alert('이미지는 10개 이하만 업로드 가능합니다.');
				return;
			}
			//엘리먼트 추가
			
			/* var tag = "<ul>";
			tag += "<li><div class='log_img_wrap'><img src='' class='t_img' id='image"+index+"'/></div></li>";
			tag += "<li><input type='checkbox' name='isCoverImg' value='1'>대표이미지</li>";
			tag += "<li><input type='text' name='tContent'/></li>";
			tag += "<li><input type='text' name='tPlace'/></li></ul>"; 
			$("#detail_div").append(tag); */
			
			var ul = document.createElement('ul');
			var li_1 = document.createElement('li');
			var div = document.createElement('div');
				div.className = 'log_img_wrap';
			var img_tag = document.createElement('img');
				img_tag.className = 't_img';
				img_tag.src = "";
				img_tag.id = 'image'+index;
			div.appendChild(img_tag);
			li_1.appendChild(div);
			var li_2 = document.createElement('li');
			var input_check = document.createElement('input');
				input_check.type = 'checkbox';
				input_check.id = 'isCoverImg'+index;
			li_2.textContent = '대표이미지';
			li_2.appendChild(input_check);
			var li_3 = document.createElement('li');
			var input_content = document.createElement('input');
				input_content.type = 'text';
				input_content.id = 'tContent'+index;
				input_content.className = 'texts';
			li_3.textContent='여행일기  :  ';
			li_3.appendChild(input_content);
			var li_4 = document.createElement('li');
			var input_place = document.createElement('input');
				input_place.type = 'text';
				input_place.id = 'tPlace'+index;
				input_place.className = 'texts';
			li_4.textContent = "사진 장소'&emsp;':'&emsp;'";
			li_4.appendChild(input_place);
			ul.appendChild(li_1);
			ul.appendChild(li_2);
			ul.appendChild(li_3);
			ul.appendChild(li_4);
			
			//이미지 미리보기 div에 append
			var detail_div = document.getElementById('detail_div');
			detail_div.appendChild(ul);
			
			//이미지 미리보기
			const fReader = new FileReader();
			fReader.onload = function() {
				const img = document.getElementById("image" + index);
				img.src = this.result;
			}
			fReader.readAsDataURL(file);
		});
	}
}
/*=============== 글 등록 =================================================================*/
$("#write_btn").click(function(){
	/* 유효성 검사...*/
	
	
	/*글 등록 시작*/
	if(confirm('글을 등록하시겠습니까?')){		
			//form 내용, detailMapList 따로 보내기(multipart & json.stringify때문에)
			var url = $("#log_form").attr("action");
        	var form = $('#log_form')[0];
        	var formData = new FormData(form);
        	//console.log(url);
        	//console.log(form);
        	/*======== 1번째 ajax==========================================================*/
			$.ajax({
	          url: url,
	          type: 'POST',
	          data: formData,
	          cache: false,
	          contentType: false,
	          processData: false,
	          success: function (fileNames) {
		                //alert('1번 성공');
		                var input = document.querySelector("input[type=file]");
		        		
		        		if(input.files){	//input 태그에 파일이 있을 경우
		        			//forEach 사용을 위해 files를 배열화(files는 forEach 사용 불가);
		        			const fileArr = Array.from(input.files);
		        			
		        			var dataList = []; //데이터Map이 담길 List
		        			
		        			//Map에 데이터 담기(이미지 개수만큼 루프)
		        			fileArr.forEach(function(file, index) { 
		        		        var map = {}; //데이터가 담길 Map(Object) 선언
		        		 
		        		        map["tImg"]=fileNames[index]; //컨트롤러에서 받아온 변환된 파일명
		        		        if($("#isCoverImg"+index).is(":checked")){
		        		        	map["isCoverImg"] = 1;
		        		        }else{
		        		        	map["isCoverImg"] = 0;
		        		        }
		        		        map["tContent"] = $("#tContent"+index).val();
		        		        map["tPlace"] = $("#tPlace"+index).val();
		        		 
		        		        dataList.push(map) ; //List에 Map 넣기
		        		    })
		        		    /*======== 2번째 ajax==========================================================*/
		        		    $.ajax({
					          url: '/myLog/detailWriteOk',
					          type: 'POST',
					          data: JSON.stringify(dataList),
					          contentType: 'application/json',
					          success: function (data) {
					        	  if(data>0){
					        		  location.href='/member/profile?userNum='+data;
					        	  }else{
					        		  alert("에러");
					        	  }
					          },
					          error: function (e) {
						            alert("error = "+ e.responseText);
						      }
		        		   }) //2번 ajax
		        		}else{
		        			alert('파일 없음');
		        		}
	          },
	          error: function (e) {
	            alert("error = "+ e.responseText);
	          }
	        }); //1번 ajax
	}//if(confirm)
	return false;
})