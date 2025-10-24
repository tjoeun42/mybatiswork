package com.mybatis.board.controller;

import java.io.IOException;

import com.mybatis.board.dto.Reply;
import com.mybatis.board.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rinsert.bo")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reply r = new Reply();
		r.setRefBno(Integer.parseInt(request.getParameter("refBno")));
		r.setReplyWriter(request.getParameter("writer"));
		r.setReplyContent(request.getParameter("content"));
		
		int result = new BoardServiceImpl().insertReply(r);
		response.getWriter().print(result);
	}
}