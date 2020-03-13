package com.spring.board.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.CodeVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		int result = 0;
		
		for(BoardVo i : boardVo.getBoardVoList()) {
			/* i.setCreator(boardVo.getCreator()); */
			
			result = boardDao.boardInsert(i);
		}
	
		return result;
	}

	@Override
	public int boardDelete(int boardNum, String boardType) throws Exception {
		// TODO Auto-generated method stub
		
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardNum(boardNum);
		boardVo.setBoardType(boardType);
		return boardDao.boardDelete(boardVo);
	}
	


	@Override
	public BoardVo boardUpdateForm(int boardNum, String boardType) throws Exception {
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardNum(boardNum);
		boardVo.setBoardType(boardType);
		return boardDao.boardUpdateForm(boardVo);
	}

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardUpdate(boardVo);
	}

	
	/* code list 출력 */
	@Override
	public List<CodeVo> codeList() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.codeList();
	}

	@Override
	public List<CodeVo> codeNameList() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.codeNameList();
	}

	@Override
	public void boardHitCount(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		 boardDao.boardHitCount(boardNum);
	}



}

