<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- logout modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            	로그아웃 하시려면 로그아웃버튼을 눌러주세요.
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="/member/logout" style="color:white">로그아웃</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h3 id="modal-title" class="modal-title">회원 정보 수정</h3>
				<button data-dismiss="modal" class="delBtn btn">&times;</button>
			</div>
			<form class="modal-body modalBody">
				<div>
					<h5>관리자 권한</h5><hr/>
					<div class="form-control col-6">
						<input type="radio" id="updateAdmin" name="status" value="관리자권한부여">
	     				<label for="관리자권한부여">&nbsp;관리자권한 부여</label>
					</div>
					<div class="form-control col-6">
						<input type="radio" id="updateAdminCancel" name="status" value="관리자권한없음">
	     				<label for="관리자권한없음">&nbsp;관리자권한 없음</label>
					</div>
				</div>
				<br/>
				<div>
<!-- 					<h5>회원정지</h5><hr/>
					<div id="blockMember" class="form-control col-6">
						<input type="radio" id="modifyRecommend1" name="recommend" value="회원정지">
	     				<label for="회원정지">&nbsp;회원정지</label>
					</div>
					<div id="blockMemberCancle" class="form-control col-6">
						<input type="radio" id="modifyRecommend2" name="recommend" value="회원정지해제">
	     				<label for="회원정지해제">&nbsp;회원정지 해제</label>
					</div> -->
				</div>
				<br/>
			</form>
			<div class="modal-footer">
				<button id="modalUpdate" class="delBtn btn">수정</button>
				<button data-dismiss="modal" class="delBtn btn">닫기</button>
			</div>
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- 수정 modal 끝 -->