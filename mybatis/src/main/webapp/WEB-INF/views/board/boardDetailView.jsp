<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer" align="center">
		<h2>게시판 상세 조회</h2>
		<table>
			<tr>
				<th>글번호</th>
				<td>${b.boardNo}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${b.boardTitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${b.boardWriter}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${b.count}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${b.createDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${b.boardContent}</td>
			</tr>
		</table>
	</div>
</body>
</html>