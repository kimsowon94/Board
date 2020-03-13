package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.UserVo;

public interface UserDao 
{
	public int checkUserId(UserVo userVo) throws Exception;
	
	public List<CodeVo> codeMenuList() throws Exception;
	
	public int joinInsert(UserVo userVo) throws Exception;
	
	public int loginConfirm(UserVo userVo) throws Exception;
	
	public String searchName(UserVo userVo) throws Exception;
	
	public String searchUserName(BoardVo boardVo) throws Exception;
}
