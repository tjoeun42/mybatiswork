package com.mybatis.member.repository;

import org.apache.ibatis.session.SqlSession;

public class MemberRepository {

	public int checkId(SqlSession sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}

}
