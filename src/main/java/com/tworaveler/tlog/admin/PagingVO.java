package com.tworaveler.tlog.admin;

public class PagingVO {

	private int currentPage = 1;     // 현재페이지
	private int startPage = 1;       // 시작페이지
	private int postsPerPage = 4;    // 한 페이지당 표시할 글 개수
	private int displayPageNum = 5;  // 하단에 한 번에 표시할 페이지 수
	private int totalPosts;          // 모든 글 개수(DB)
	private int totalPages;          // 총 페이지 수
	private int offset = 0; 	     // 몇번째 부터 10개씩 가져올 것인지(구간정하기)
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		// offset위치 계산
		setOffset((currentPage-1)*postsPerPage);
		// 페이지 번호의 시작값
		startPage = ((currentPage-1)/displayPageNum*displayPageNum)+1;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getPostsPerPage() {
		return postsPerPage;
	}
	public void setPostsPerPage(int postsPerPage) {
		this.postsPerPage = postsPerPage;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalPosts() {
		return totalPosts;
	}
	public void setTotalPosts(int totalPosts) {
		this.totalPosts = totalPosts;
		// 총 페이지 수
		if(totalPosts%postsPerPage==0) { // 총 게시글 수에서 한 페이지당 표시할 수가 나누어떨어지면 
			totalPages = totalPosts/postsPerPage; // 나눗셈 몫이 totalPosts안으로
		}else {
			totalPages = (int)Math.ceil((double)totalPosts/postsPerPage); // 몫+1 그 다음 페이지로
		}
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}


	
}
