//좋아요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function LikeUp(tNum){
   var param = {"tNum":tNum};
   $.ajax({
      url:'/log/likeUp',
      data:param,
      type:'POST',
      success:function(r){
    	  	var tag="<i class='fa-solid fa-thumbs-up' onclick='LikeDown("+r.tNum+")'></i> &emsp;"+r.likeNum;
    		$(".logLike").html(tag);
      }
   });
}
//좋아요 취소~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function LikeDown(tNum){
   var param = {"tNum":tNum};
   $.ajax({
      url:'/log/likeDown',
      data:param,
      type:'GET',
      success:function(r){
    	  var tag="<i class='fa-thin fa-thumbs-up' onclick='LikeUp("+r.tNum+")'></i> &emsp;"+r.likeNum;
    	  $(".logLike").html(tag);
      }
   })
}

//글 삭제~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function logDel(tNum){
	if(confirm('글을 삭제하시겠습니까?')){
		var param = {"tNum" : tNum};
	   	$.ajax({
	      url:'/log/logDel',
	      data:param,
	      type:'GET',
	      success:function(userNum){
				alert('글이 삭제되었습니다.');
	    	  	location.href='/member/profile?userNum='+userNum;
	      }
	   	})
   }
}