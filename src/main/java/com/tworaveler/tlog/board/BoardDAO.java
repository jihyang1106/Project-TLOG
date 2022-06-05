package com.tworaveler.tlog.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BoardDAO {
	
	public List<BoardVO> selectRecent(int startNum, int limitNum);
}
