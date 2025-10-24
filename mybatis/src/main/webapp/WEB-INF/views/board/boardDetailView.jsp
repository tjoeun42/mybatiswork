<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.detail table {
	    border:1px solid;
	    border-collapse: collapse;
	    width: 500px;
	    text-align: center;
	    table-layout: fixed;
	}
	.detail td, th {
	    border:1px solid;
	    word-break: break-all;
	    white-space: normal;
	}
	.outer a {
	    text-decoration:none;
	    color: black;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="detail" align="center">
		<h2>게시판 상세 조회</h2>
		<table>
			<tr>
				<th width="80px">글번호</th>
				<td width="420px">${b.boardNo}</td>
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
		<br>
		<table>
			<thead>
				<tr>
					<th width="80px">댓글작성</th>
					<th width="340px"><textarea rows="3" cols="45" name="centent"></textarea>
					<th width="80px"><input type="button" value="댓글작성" id="replyInsert"></th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>