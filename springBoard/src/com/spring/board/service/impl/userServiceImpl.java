package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.service.UserService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.UserVo;




@Service
public class userServiceImpl implements UserService
{
	@Autowired
	UserDao userDao;

	@Override
	public List<CodeVo> codeMenuList() throws Exception {
		// TODO Auto-generated method stub
		return userDao.codeMenuList();
	}

	@Override
	public int joinInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.joinInsert(userVo);
	}
	

	@Override
	public int checkUserId(String userId) throws Exception {
		UserVo userVo = new UserVo();
		userVo.setUserId(userId);
		
		return userDao.checkUserId(userVo);
	}

	@Override
	public int loginConfirm(String userId, String userPw) throws Exception {
		// TODO Auto-generated method stub
		UserVo userVo = new UserVo();
		userVo.setUserId(userId);
		userVo.setUserPw(userPw);
		return userDao.loginConfirm(userVo);
	}

	@Override
	public String searchName(String userId) throws Exception {
		// TODO Auto-generated method stub
		
		UserVo userVo = new UserVo();
		userVo.setUserId(userId);
		return userDao.searchName(userVo);
	}

	@Override
	public String searchUserName(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		boardVo.setBoardNum(boardNum);
		return userDao.searchUserName(boardVo);
	}


	
}
