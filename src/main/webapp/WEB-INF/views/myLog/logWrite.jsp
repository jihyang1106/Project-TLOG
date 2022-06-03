<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.log_img_wrap {
		border: 1px solid rgba(118, 118, 118, 0.5);
		width: 300px;
		height: 400px;
		overflow: hidden;
		color: gray;
		cursor: pointer;
		text-align: center;
	}
	.t_img{
		max-width: 300px;
		max-height: 400px;
	}

</style>
<form action='/myLog/logWriteOk' method='POST' enctype="multipart/form-data">
	<ul>
		<li>제목 : <input type='text' name='tTile'/></li>
		<li><input type='date' name='startDate'/> - <input type='date' name='endDate'/></li>
		<li>위치정보 : <input type='text' name='placeInfo'/></li>
		<li>
	      <label><input type="radio" name="isPrivate" value="1"> 비밀일기 </label>
	      <label><input type="radio" name="isPrivate" value="0"> 공유일기 </label>
	    </li>
	</ul>
	tagUser
	tagLog
	
	<!-- 일기 세부 사항 -->
	<ul>
		<li><input type='checkbox' name='isCoverImg' value='1'>대표이미지</li>
		<li><div class="log_img_wrap">
				<span class="img_upload_phr">Click here!</span> <img src="" class="t_img" />
            </div>
            <input type="file" name="tImg" class="log_img" style="display: none" />
        </li>
		<li><input type='text' name='tContent'/></li>
		<li><input type='text' name='tPlace'/></li>
	</ul>
	<ul>
		<li><input type='checkbox' name='isCoverImg' value='1'>대표이미지</li>
		<li><div class="log_img_wrap">
				<span class="img_upload_phr">Click here!</span> <img src="" class="t_img" />
            </div>
            <input type="file" name="tImg" class="log_img" style="display: none" />
        </li>
		<li><input type='text' name='tContent'/></li>
		<li><input type='text' name='tPlace'/></li>
	</ul>
	<ul>
		<li><input type='checkbox' name='isCoverImg' value='1'>대표이미지</li>
		<li><div class="log_img_wrap">
				<span class="img_upload_phr">Click here!</span> <img src="" class="t_img" />
            </div>
            <input type="file" name="tImg" class="log_img" style="display: none" />
        </li>
		<li><input type='text' name='tContent'/></li>
		<li><input type='text' name='tPlace'/></li>
	</ul>
    <input type='submit' value='일기 등록'/>
</form>
<script>


$(".log_img_wrap").click(function() {
   $(this).next().trigger("click");
})

//이미지 미리보기
$(document).on("change", '.log_img', function() {
	console.log(this);
	let pImg = $(this);
   if (this.files && this.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function(e) {
	         pImg.prev().children().last().prop('src', e.target.result); //이미지 변경
	      }
	      reader.readAsDataURL(this.files[0]);
	      $(this).prev().children().first().css("display", "none"); //click this 지우기
	}
});
</script>