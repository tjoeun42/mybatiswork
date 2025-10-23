package com.mybatis.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.board.dto.Board;
import com.mybatis.board.dto.Reply;
import com.mybatis.board.repository.BoardRepository;
import com.mybatis.common.dto.PageInfo;
import static com.mybatis.common.template.Template.*;

public class BoardServiceImpl implements BoardService {
	private BoardRepository bDao = new BoardRepository();
	
	@Override
	public int totalRecord() {
		SqlSession sqlSession = getSqlSession();
		int totalRecord = bDao.totalRecord(sqlSession);
		sqlSession.close();
		return totalRecord;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = bDao.selectList(sqlSession, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public int increaseCount(int boardNo) {
		SqlSession sqlSession = getSqlSession();
		int result = bDao.increaseCount(sqlSession, boardNo);
		
		if(result > 0) 
			sqlSession.commit();
		
		sqlSession.close();
		return result;
	}

	@Override
	public Board selectBoard(int boardNo) {
		SqlSession sqlSession = getSqlSession();
		Board b = bDao.selectBoard(sqlSession, boardNo);
		sqlSession.close();
		return b;
	}
	
	@Override
	public int replyRecord(int boardNo) {
		SqlSession sqlSession = getSqlSession();
		int result = bDao.replyRecord(sqlSession, boardNo);
		sqlSession.close();
		return result;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Reply> list = bDao.selectReplyList(sqlSession, boardNo, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		SqlSession sqlSession = getSqlSession();
		int searchCount = bDao.selectSearchCount(sqlSession, map);
		sqlSession.close();
		return searchCount;
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = bDao.selectSearchList(sqlSession, map, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
