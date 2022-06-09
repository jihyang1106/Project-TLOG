

//좋아요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function LikeUp(tNum){
   var param = {"tNum":tNum};
   $.ajax({
      url:'/logShare/likeUp',
      data:param,
      type:'POST',
      success:function(r){
    	  	var tag="<i class='fa-solid fa-thumbs-up' onclick='LikeDown("+r.tNum+")' style='color:rgba(122, 140, 226,100%);'></i> &emsp;"+r.likeNum;
    		$(".logLike").html(tag);
      }
   });
}
//좋아요 취소~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function LikeDown(tNum){
   var param = {"tNum":tNum};
   $.ajax({
      url:'/logShare/likeDown',
      data:param,
      type:'GET',
      success:function(r){
    	  var tag="<i class='fa-regular fa-thumbs-up' onclick='LikeUp("+r.tNum+")'  style='color:rgba(122, 140, 226,100%);'></i> &emsp;"+r.likeNum;
    	  $(".logLike").html(tag);
      }
   })
}

//글 삭제~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function logDel(tNum){
	if(confirm('글을 삭제하시겠습니까?')){
		var param2 = {"tNum" : tNum};
		console.log(param2);
	   	$.ajax({
	      url:'/logShare/logDel',
	      data:param2,
	      type:'GET',
	      success:function(userNum){
				alert('글이 삭제되었습니다.');
	    	  	location.href='/member/profile?userNum='+userNum;
	      }
	   	})
   }
}
//글 수정~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function logEdit(tNum){
	if(confirm('글을 수정하시겠습니까?')){
		location.href='/logShare/logEdit?tNum='+tNum;
   }
}