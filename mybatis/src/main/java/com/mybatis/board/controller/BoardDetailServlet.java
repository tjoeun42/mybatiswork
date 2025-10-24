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
		
		if(request.getSession().getAttribute("viewedBoard_"+boardNo) == null) {
			int result = bService.increaseCount(boardNo);
	
			if(result > 0) {
				request.getSession().setAttribute("viewedBoard_"+boardNo, true);
				
				Board b = bService.selectBoard(boardNo);
				
				int replyRecord = bService.replyRecord(boardNo);
				PageInfo rpi = Pagination.getPageInfo(replyRecord, nowPage, 5, 2);
				
				ArrayList<Reply> rlist = bService.selectReplyList(boardNo, rpi);
				
				request.setAttribute("b", b);
				request.setAttribute("rpi", rpi);
				request.setAttribute("rlist", rlist);
				
				request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("errorMsg", "상세조회 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp")
						.forward(request, response);
			}
		} else {
			Board b = bService.selectBoard(boardNo);
			
			int replyRecord = bService.replyRecord(boardNo);
			PageInfo rpi = Pagination.getPageInfo(replyRecord, nowPage, 5, 2);
			
			ArrayList<Reply> rlist = bService.selectReplyList(boardNo, rpi);
			
			request.setAttribute("b", b);
			request.setAttribute("rpi", rpi);
			request.setAttribute("rlist", rlist);
			
			request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp")
					.forward(request, response);
		}
	}

}
