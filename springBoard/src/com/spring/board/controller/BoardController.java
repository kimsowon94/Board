package com.spring.board.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.dao.BoardDao;
import com.spring.board.dao.impl.BoardDaoImpl;
import com.spring.board.service.UserService;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;
import com.spring.board.vo.CodeVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;
	
	@Autowired
	UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "board/boardList.do", method = RequestMethod.GET)
	public String boardList(HttpSession session, HttpServletRequest request,Locale locale, Model model
			,@RequestParam(defaultValue="1") int pageNo1, PageVo pageVo) throws Exception {
		
		String[] codeId = request.getParameterValues("codeId"); 	
		
		if(codeId != null)
		{
			for (int i=0; i<codeId.length; i++)
			{
				System.out.println("String[] code Id : " + codeId[i].toString());
			}
		}
		
		List<CodeVo> codeList = new ArrayList<CodeVo>(); 
		codeList =	boardService.codeList();   
				
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1; 
		int totalCnt = 0;
	  	
	
		if (pageVo.getPageNo1() == 0) { pageVo.setPageNo1(page);
	  
		}
		 
		
		/*============================================*/
		
		int num = boardService.selectBoardCnt();
		
		PageVo paging = new PageVo();
		paging.setPageNo1(pageNo1); 
		paging.setPageSize(10);
		paging.setTotalCount(num);

		
		model.addAttribute("paging", paging);
		/*============================================*/
		// session�솗�씤�븯湲�
		String userId=(String) session.getAttribute("userId");
		
		if(userId != null)
		{
			String userName = userService.searchName(userId);
			
			System.out.println("session�씠由� : " + userName);
			model.addAttribute("userName", userName);
			
			
		}
		
		model.addAttribute("sessionId", userId);
	
		
		pageVo.setCodeId(codeId);

		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();

		
		model.addAttribute("codeList", codeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		/* model.addAttribute("pageNo1", pageNo1); */

		return "board/boardList";
	}

	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum, HttpSession session) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);
		// session
		String userId=(String) session.getAttribute("userId");
		
		if(userId != null)
		{
			String userName = userService.searchName(userId);
			
			
			model.addAttribute("userName", userName);
			model.addAttribute("userId", userId);
		}
		
		// 조회수 증가 하게 만드는 구문
		boardService.boardHitCount(boardNum);
		
		String name = userService.searchUserName(boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		model.addAttribute("name", name);

		return "board/boardView";
	}

	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, HttpSession session) throws Exception {

		List<CodeVo> codeList = new ArrayList<CodeVo>();

		codeList = boardService.codeList();

		model.addAttribute("codeList", codeList);
		
		// session�솗�씤�븯湲�
		String userId=(String) session.getAttribute("userId");
		
		if(userId != null)
		{
			String userName = userService.searchName(userId);
			
			System.out.println("�쑀���꽕�엫 �솗�씤 : " + userName);
			model.addAttribute("userName", userName);
			model.addAttribute("userId", userId);
			
			
		}
		return "board/boardWrite";
	}

	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo, CodeVo codeVo, Model model, PageVo pageVo) throws Exception {


		HashMap<String, String> result = new HashMap<String, String>();

		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardInsert(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		
		  int page = 1;
		  
		  if (pageVo.getPageNo1() == 0) { pageVo.setPageNo1(page);
		  
		  }
		 
		String pageNo1 = Integer.toString(pageVo.getPageNo1());

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("pageNo1", pageNo1);
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	
	@RequestMapping(value = "/board/boardDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String boardDelete(Locale locale, int boardNum, String boardType) throws Exception 
	{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultDelete = boardService.boardDelete(boardNum, boardType);

		result.put("success", (resultDelete > 0) ? "Y" : "N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg:" + callbackMsg);

		return callbackMsg;	 
	}
	
	
	@RequestMapping(value="/board/boardUpdateForm.do", method = RequestMethod.GET)
	public String boardUpdateForm(int boardNum, HttpServletRequest request, String boardType, Model model, HttpSession session) throws Exception
	{
		request.setAttribute("data", boardService.boardUpdateForm(boardNum, boardType));
		List<CodeVo> codeList = new ArrayList<CodeVo>();

		codeList = boardService.codeList();
		
		// session�솗�씤�븯湲�
		String userId = (String) session.getAttribute("userId");

		if (userId != null) {
			String userName = userService.searchName(userId);
		
			model.addAttribute("userName", userName);
		}
		
		model.addAttribute("codeList", codeList);
		return "board/boardUpdate";	
	}
	
	
	@RequestMapping(value = "/board/boardUpdate.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String boardUpdate(Locale locale, BoardVo boardVo, HttpSession session, Model model) throws Exception
	{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultUpdate = boardService.boardUpdate(boardVo);

		result.put("success", (resultUpdate > 0) ? "Y" : "N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);
		
		

		return callbackMsg;

	}

	@RequestMapping(value="/board/logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpSession session, HttpServletRequest request)
	{
		String id=(String) session.getAttribute("userId");
		
		session.removeAttribute(id);
		
		session.invalidate();
		
		System.out.println(id);
		
		
		return "redirect:boardList.do";
		
	}
	
	

}
