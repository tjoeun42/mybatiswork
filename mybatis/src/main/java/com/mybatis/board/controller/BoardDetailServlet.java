package com.mybatis.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.mybatis.board.dto.Board;
import com.mybatis.board.dto.Reply;
import com.mybatis.board.service.BoardService;
import com.mybatis.board.service.BoardServiceImpl;
import com.mybatis.common.dto.PageInfo;
import com.mybatis.common.template.Pagination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService bService = new BoardServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = bService.increaseCount(boardNo);

		if(result > 0) {
			Board b = bService.selectBoard(boardNo);
			System.out.println("board title : " + b.getBoardTitle());
			
			int replyRecord = bService.replyRecord(boardNo);
			PageInfo pi = Pagination.getPageInfo(replyRecord, nowPage, 5, 2);
			System.out.println("댓글의 갯수 : " + replyRecord);
			
			ArrayList<Reply> list = bService.selectReplyList(boardNo, pi);
			System.out.println("댓글의 리스트 갯수 : " + list.size());
		}
		
	}

}
