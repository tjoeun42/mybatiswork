package com.mybatis.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.mybatis.board.dto.Board;
import com.mybatis.board.dto.Reply;
import com.mybatis.common.dto.PageInfo;

public interface BoardService {
	// 게시글 조회
	int totalRecord();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 게시판 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	int replyRecord(int boardNo);
	ArrayList<Reply> selectReplyList(int boardNo, PageInfo pi);
	
	// 게시글 검색
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 댓글 등록
	int insertReply(Reply r);
}







