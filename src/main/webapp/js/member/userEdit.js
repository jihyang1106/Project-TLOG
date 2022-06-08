$(function() {
	const fileInput = document.getElementById('imgFile');
	const handleFiles = () => {
		const selectedFile = [...fileInput.files];
		const fileReader = new FileReader();
		
		fileReader.readAsDataURL(selectedFile[0]);
		fileReader.onload = function() {
			document.getElementById("previewImg").src = fileReader.result;
		};
	};
	fileInput.addEventListener("change", handleFiles);
	// 이미지제거 클릭시 기본 이미지로 프로필 사진 변경
	$('#defaultProfile').click(function() {
		$('#previewImg').attr('src', '/img/profile/default_profile.png');
		$('#imgFile').val('');
		$('#profile').val('');
	});
});
//top bottom 안보이게 하기
document.addEventListener("DOMContentLoaded", function(event){
    document.getElementById('top').style.display = "none";
    document.getElementById('bottom').style.display = "none";
    console.log()
    for(let i = 0; i < $("#allTagCnt").children().length; i++){
		for(let j = 0; j < $("#myTagCnt").children().length; j++){
			if($('#tagvalue'+i).val()==$('.myTag'+j).html()){
				console.log($('#tagvalue'+i).val()+ " / " + $('.myTag'+j).html())
				$('#tagWord'+$('#tagvalue'+i).val()).trigger("click");
			}
		}
	}
});

/*//태그 토글
$('.tagWord').click(function(){
	var tagStatus = $('#tagStatus'+$(this).children(".tagvalue").val());
	var tagvalue = $(this).children(".tagvalue");
	if(tagStatus.val() == "N"){
		tagStatus.val("Y");
		tagvalue.attr("checked",true);
	}else{
		tagStatus.val("N");
		tagvalue.removeAttr("checked");
	}
	$(this).toggleClass("checked");
});*/

/*================ 태그 선택 ==================*/
//.tags클릭 시 chk상태확인 후  css && chk 변화
$(".tagWord").click(function(){
	//체크된 상태일 때
	if($(this).children('.tagvalue').is(":checked")){ 
		$(this).children('.tagvalue').prop("checked", false); //체크 해제
		$(this).css("background-color", "#fff");
		
	//체크된 상태 아닐 때
	}else{ 
		$(this).children('.tagvalue').prop("checked", true);
		var id = $(this).children('.hiddenTags').attr('id');
		switch(id){
		case'tagStatus1': case'tagStatus2':
			$(this).css("background-color", "rgb(42, 76, 211, 70%)");
		break
		case'tagStatus3': case'tagStatus4': case'tagStatus5': case'tagStatus6': case'tagStatus7':
			$(this).css("background-color", "rgba(122, 140, 226, 80%)");
		break
		case'tagStatus8': case'tagStatus9': case'tagStatus10': case'tagStatus11': case'tagStatus12': case'tagStatus13': case'tagStatus14':
			$(this).css("background-color", "rgba(122, 140, 226, 30%)");
		break
		case'tagStatus15': case'tagStatus16': case'tagStatus17': case'tagStatus18': case'tagStatus19': case'tagStatus20':
			$(this).css("background-color", "#C3E2DD");
		break
		case'tagStatus21': case'tagStatus22': case'tagStatus23': case'tagStatus24': case'tagStatus25':
			$(this).css("background-color", "#FEF5D4");
		break
		case'tagStatus26': case'tagStatus27': case'tagStatus28': case'tagStatus29':
			$(this).css("background-color", "#EACACB");
		break
		}
	}
})