/*================ 태그 선택 ==================*/
//.tags클릭 시 chk상태확인 후  css && chk 변화

$(".tags").click(function(){
	//체크된 상태일 때
	if($(this).next().is(":checked")){ 
		$(this).next().prop("checked", false); //체크 해제
		$(this).css("background-color", "#eee");
		if($(this).prop("id") == 'region'){
			for(var i=1; i<=14; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'tag1'){
			$("#tag2").css("display", "inline-block");
			for(var i=3; i<=7; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'tag2'){
			$("#tag1").css("display", "inline-block");
			for(var i=8; i<=14; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'age'){
			for(var i=15; i<=20; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'group'){
			for(var i=21; i<=25; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}else if($(this).prop("id") == 'season'){
			for(var i=26; i<=29; i++){
				$("#tag"+i).css("display", "none");	
				$("#tag"+i).css("background-color", "#eee");
				$("#tag"+i).next().prop("checked", false); //체크 해제
			}
		}
	//체크된 상태 아닐 때
	}else{ 
		$(this).next().prop("checked", true);
		var id = $(this).attr('id');
		switch(id){
		case'region':
			$(this).css("background-color", "#aaa");
				$("#tag1").css("display", "inline-block");	
				$("#tag2").css("display", "inline-block");	
		break;
		case'tag1': case'tag2':
			$(this).css("background-color", "rgb(42, 76, 211, 70%)");
			if($(this).prop("id") == 'tag1'){
				$("#tag2").css("display", "none");
				$("#tag3").css("display", "inline-block");	
				$("#tag4").css("display", "inline-block");	
				$("#tag5").css("display", "inline-block");	
				$("#tag6").css("display", "inline-block");	
				$("#tag7").css("display", "inline-block");	
			}else if($(this).prop("id") == 'tag2'){
				$("#tag1").css("display", "none");
				$("#tag8").css("display", "inline-block");	
				$("#tag9").css("display", "inline-block");	
				$("#tag10").css("display", "inline-block");	
				$("#tag11").css("display", "inline-block");	
				$("#tag12").css("display", "inline-block");
				$("#tag13").css("display", "inline-block");	
				$("#tag14").css("display", "inline-block");	
			}
		break
		case'tag3': case'tag4': case'tag5': case'tag6': case'tag7':
			$(this).css("background-color", "rgba(122, 140, 226, 80%)");
		break
		case'tag8': case'tag9': case'tag10': case'tag11': case'tag12': case'tag13': case'tag14':
			$(this).css("background-color", "rgba(122, 140, 226, 30%)");
		break
		case'age':
			$(this).css("background-color", "#aaa");
				$("#tag15").css("display", "inline-block");	
				$("#tag16").css("display", "inline-block");
				$("#tag17").css("display", "inline-block");	
				$("#tag18").css("display", "inline-block");
				$("#tag19").css("display", "inline-block");	
				$("#tag20").css("display", "inline-block");	
		break;
		case'tag15': case'tag16': case'tag17': case'tag18': case'tag19': case'tag20':
			$(this).css("background-color", "#C3E2DD");
		break
		case'group':
			$(this).css("background-color", "#aaa");
				$("#tag21").css("display", "inline-block");	
				$("#tag22").css("display", "inline-block");
				$("#tag23").css("display", "inline-block");	
				$("#tag24").css("display", "inline-block");
				$("#tag25").css("display", "inline-block");	
		break;
		case'tag21': case'tag22': case'tag23': case'tag24': case'tag25':
			$(this).css("background-color", "#FEF5D4");
		break
		case'season':
			$(this).css("background-color", "#aaa");
				$("#tag26").css("display", "inline-block");	
				$("#tag27").css("display", "inline-block");
				$("#tag28").css("display", "inline-block");
				$("#tag29").css("display", "inline-block");	
		break;
		case'tag26': case'tag27': case'tag28': case'tag29':
			$(this).css("background-color", "#EACACB");
		break
		}
		
		
	}
})

/*================ 태그할 유저 선택 ==================*/
var cnt=0;
function PlusUser(){
	if(cnt<6){
		var li ="<li><input type='hidden' name='userNumList'/><input type='text' class='tag_box'/>&nbsp;&nbsp;<i class='fa-solid fa-xmark'></i>&nbsp;&nbsp;&nbsp;</li>";
		$("#tag_user_ul").append(li);
		cnt++;
		console.log(cnt);
		if(cnt>=6){
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
			var tagBox = $(this);
			var ul = $(".search_user_ul"); //유저리스트 들어갈 ul
			var data = {"userNick" : $(this).val()};
			//console.log(data);
			$.ajax({
		          url: '/logShare/searchUserList',
		          type: 'GET',
		          data: data,
		          success: function (data) {
		        	  var list = "";
		        	  for(var i=0; i<data.length; i++){
		        		  list += "<li class='search_user_li' value='"+data[i].userNum+"'>";
		        		  list += "<img src='"+data[i].profileImg+"' class='profile_img'/>&nbsp;"+data[i].userNick;
		        		  list += "</li>";
		        	  }
		        	  ul.html(list); //ul태그 안에 넣기
		        	  //console.log(list);
		        	  
		        		//검색된 유저 클릭 시====================================================================
		        		$(".search_user_li").on('click', function(){
		        			var userNum = $(this).val();
		        			var userNick = $(this).text();
		        			//console.log(userNum, userNick);
		        			tagBox.val(userNick); //inputText
		        			tagBox.prev().val(userNum); //inputHidden
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
$(".img_upload_phr").click(function(e) {
	e.preventDefault();
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
				ul.className = 'logElement';
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
			li_2.textContent = '대표이미지\u00A0\u00A0';
			li_2.appendChild(input_check);
			var li_3 = document.createElement('li');
			var input_place = document.createElement('input');
				input_place.type = 'text';
				input_place.id = 'tPlace'+index;
				input_place.className = 'texts';
			li_3.textContent = '사진 장소 : ';
			li_3.appendChild(input_place);
			var li_4 = document.createElement('li');
			var textarea_content = document.createElement('textarea');
				textarea_content.type = 'text';
				textarea_content.id = 'tContent'+index;
				textarea_content.className = 'logTextContent';
				textarea_content.placeholder = '여행일기를 입력해주세요';
				textarea_content.resize = 'none';
			li_4.appendChild(textarea_content);
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
					          url: '/logShare/detailWriteOk',
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