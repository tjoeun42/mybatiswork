<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list-area table {
		border:1px solid;
		border-collapse: collapse;
		width: 500px;
		text-align: center;
	}
	#list-area td, th {
		border:1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div>
		<h2 align="center">게 시 판</h2>
		
		<div id="search-area">
			<form action="search.bo">
				<select name="keyField">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input name="keyWord">
				<input type="submit" value="검색">
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
		<br>
		
		<div id="list-area" align="center">
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th width="50%">제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
						<tr>
							<td>${ b.boardNo }</td>
							<td>${ b.boardTitle }</td>
							<td>${ b.boardWriter }</td>
							<td>${ b.count }</td>
							<td>${ b.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		
		<div id="paging-area">
		</div>
	</div>
</body>
</html>