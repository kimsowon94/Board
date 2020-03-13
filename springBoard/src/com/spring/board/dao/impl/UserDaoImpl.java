package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.UserVo;



@Repository
public class UserDaoImpl implements UserDao
{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkUserId(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.checkUserId", userVo);
	}


	@Override
	public List<CodeVo> codeMenuList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.codeMenuList");
	}

	@Override
	public int joinInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.joinInsert", userVo);
	}


	@Override
	public int loginConfirm(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.loginConfirm", userVo);
	}


	@Override
	public String searchName(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.searchName", userVo);
	}


	@Override
	public String searchUserName(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.searchUserName", boardVo);
	}
	
}
