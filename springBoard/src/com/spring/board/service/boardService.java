package com.spring.board.service;

import java.util.List;


import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.CodeVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardDelete(int boardNum, String boardType) throws Exception;
	
	public BoardVo boardUpdateForm(int boardNum, String boardType) throws Exception;
		
	public int boardUpdate(BoardVo boardVo) throws Exception;
	

	//code list 출력하기
	public List<CodeVo> codeList() throws Exception;
	
	// write문에 code name 출력하기
	public List<CodeVo> codeNameList() throws Exception;
	

}
