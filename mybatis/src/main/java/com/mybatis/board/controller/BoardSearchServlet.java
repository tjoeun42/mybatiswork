package com.mybatis.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.mybatis.board.dto.Board;
import com.mybatis.board.service.BoardServiceImpl;
import com.mybatis.common.dto.PageInfo;
import com.mybatis.common.template.Pagination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search.bo")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		
		int searchRecord = new BoardServiceImpl().selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchRecord, nowPage, 5, 2);
		
		ArrayList<Board> list =  new BoardServiceImpl().selectSearchList(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		
		request.getRequestDispatcher("WEB-INF/views/board/boardListView.jsp")
				.forward(request, response);
	}
}
