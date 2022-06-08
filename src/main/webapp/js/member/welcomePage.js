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
});

//태그 토글
$('.tagWord').click(function(){
	var tagStatus = $('#tagStatus'+$(this).children(".tagvalue").val());
	var tagvalue = $(this).children(".tagvalue");
	console.log(tagvalue)
	if(tagStatus.val() == "N"){
		tagStatus.val("Y");
		tagvalue.attr("checked",true);
	}else{
		tagStatus.val("N");
		tagvalue.removeAttr("checked");
	}
	$(this).toggleClass("checked");
});