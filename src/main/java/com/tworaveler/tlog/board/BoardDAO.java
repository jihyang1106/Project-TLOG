package com.tworaveler.tlog.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BoardDAO {
	
	// 글 내용 보이기
	public List<BoardVO> selectRecent(int startNum, int limitNum);
	
	// 글 작성하기
	public int boardInsert(BoardVO vo);
	
	// 글 삭제하기
	public int deleteBoard(int boardNum);
	
	//해당 회원이 작성한 글갯수 확인
	public int cntUserBoard(int userNum);
}
