$(function(){
	});
	$("#freeForm").submit(function(){
		if(CKEDITOR.instances.editor.getData()==''){
			alert("🚫 내용을 입력해주세요");
			return false;
		}
	});
