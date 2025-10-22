package com.mybatis.member.service;

import com.mybatis.member.dto.Member;

public interface MemberService {
	int checkId(String userId);
	Member loginMember(Member m);
	int updateMember(Member m);
	int deleteMember(String userId);
}
