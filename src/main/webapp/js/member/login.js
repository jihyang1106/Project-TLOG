//카카오로그인
document.addEventListener("DOMContentLoaded", function(){
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('JAVASCRIPT_KEY');
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
});