package com.mybatis.board.controller;

import java.io.IOException;

import com.mybatis.board.dto.Board;
import com.mybatis.board.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/boardInsert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board b = new Board();
		b.setBoardContent(request.getParameter("content"));
		b.setBoardTitle(request.getParameter("title"));
		b.setBoardWriter(request.getParameter("writer"));
		
		int result = new BoardServiceImpl().insertBoard(b);
		
		response.sendRedirect(request.getContextPath() + "/list.bo?nowPage=1");
	}
}