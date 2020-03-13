package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.CodeVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardDelete(BoardVo boardVo) throws Exception;
	
	public BoardVo boardUpdateForm(BoardVo boardVo) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	//게시판 조회수 증가
	public void boardHitCount(int boardNum) throws Exception;
	
	
	public List<CodeVo> codeList() throws Exception;

	public List<CodeVo> codeNameList() throws Exception;


}
