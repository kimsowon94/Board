package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.CodeVo;
import com.spring.board.vo.UserVo;

public interface UserService 
{
	/* public List<UserVo> checkUserId(String userId) throws Exception; */
	
	public List<CodeVo> codeMenuList() throws Exception;
	
	public int joinInsert(UserVo userVo) throws Exception;

	public int checkUserId(String userId) throws Exception;
	
	public int loginConfirm(String userId, String userPw) throws Exception;
	
	public String searchName(String userId) throws Exception;
	
	public String searchUserName(int boardNum) throws Exception;

	


}
