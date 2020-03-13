package com.spring.board.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.dao.UserDao;
import com.spring.board.service.UserService;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;


@Controller
public class UserController 
{
	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/join.do", method = RequestMethod.GET)
	public String join(Local local, Model model) throws Exception
	{
		List<CodeVo> codeMenuList = new ArrayList<CodeVo>();
		
		codeMenuList = userService.codeMenuList();
		
		model.addAttribute("codeMenuList", codeMenuList);
		
		return "user/join";	
	}
	
	@RequestMapping(value ="/user/login.do", method = RequestMethod.GET)
	public String login(Local local) throws Exception
	{
		return "user/login";
	}
	
	@RequestMapping(value="/user/joinInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String joinInsert(UserVo userVo, PageVo pageVo) throws Exception
	{
		int joinInsert = userService.joinInsert(userVo);
	
		
		String result = null;
		
		if(joinInsert > 0)
		{
			result = "1";
		}
		else
		{
			result = "0";
		}
		
		return result;
		
	}

	
	@RequestMapping(value ="/user/checkUserId.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String checkUserId(@RequestParam("userId") String userId) throws Exception
	{
		String result = "";
		int count = userService.checkUserId(userId);
		
		if (count == 1) 
		{
			result = "1";
		}
		else
		{
			result = "0";
		}

		
		 
		return result;
		
	}
	
	@RequestMapping(value ="/user/loginConfirm.do" , method = RequestMethod.POST)
	@ResponseBody
	public String loginConfirm(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw
								,HttpSession session) throws Exception
	{
		
		String result = "";
		
		int count = userService.loginConfirm(userId, userPw);
		
		
		if(count > 0)
		{
			session.setAttribute("userId", userId);

			result = "1";
		}
		else if(count == 0)
		{
			result = "0";
		}
		
		
		return result;
		
		
	}
	

	
	
}
