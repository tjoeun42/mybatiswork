package com.mybatis.member.service;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.common.template.Template;
import com.mybatis.member.dto.Member;
import com.mybatis.member.repository.MemberRepository;

public class MemberServiceImpl implements MemberService {
	private MemberRepository mDao = new MemberRepository();
	
	@Override
	public int checkId(String userId) {
		SqlSession sqlSession = Template.getSqlSession();
		int checkId = mDao.checkId(sqlSession, userId);
		sqlSession.close();
		return checkId;
	}

	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
