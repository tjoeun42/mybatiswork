package com.mybatis.board.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mybatis.board.dto.Board;
import com.mybatis.common.dto.PageInfo;

public class BoardRepository {

	public int totalRecord(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.totalRecord");
	}

	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi) {
		// 마이비티스에서 페이징 처리를 위한 RowBounds라는 클래스 제공
		/*
		 * offset : 몇 개의 게시글(레코드)를 건너뛰고 조회할건지에 대한 값
		 				   			offset(건너뛸 숫자)     limit(조회할 숫자)
		   nowPage : 1    1~5			0					5	
		   nowPage : 2    6~10			5					5	
		   nowPage : 3    11~15			10					5
		
		 */
		int limit = pi.getNumPerPage();   //5
		int offset = (pi.getNowPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int selectSearchCount(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.selectSearchCount", map);
	}

}
