package com.tworaveler.tlog.admin;

public class AdminVO {

	// report
	private int reportNum;
	private int userNum;
	private int reportTypeNum; // reportType
	private int boardNum;
	private int tNum;
	private String reportDate;
	private int confirmType;
	private String reportContent;
	
	// reportType
	private String reportTypeName;


	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getReportTypeNum() {
		return reportTypeNum;
	}
	public void setReportTypeNum(int reportTypeNum) {
		this.reportTypeNum = reportTypeNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public int getConfirmType() {
		return confirmType;
	}
	public void setConfirmType(int confirmType) {
		this.confirmType = confirmType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportTypeName() {
		return reportTypeName;
	}
	public void setReportTypeName(String reportTypeName) {
		this.reportTypeName = reportTypeName;
	}

}
