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
	.outer a {
		text-decoration:none;
		color: black;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2 align="center">게 시 판</h2>
		
		<div id="search-area" align="center">
			<form action="search.bo">
				<select name="keyField">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input name="keyWord" value="${ keyWord }">
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
					<c:forEach var="b" items="${ list }" varStatus="s">
						<tr>
							<td>${ pi.totalRecord-((pi.nowPage-1)*pi.numPerPage)-s.index}</td>
							<td><a href="detail.bo?bno=${b.boardNo}">${ b.boardTitle }</a></td>
							<td>${ b.boardWriter }</td>
							<td>${ b.count }</td>
							<td>${ b.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		
		<div id="paging-area" align="center">
			<c:if test="${pi.nowPage ne 1}">
				<c:choose>
					<c:when test="${empty keyField}">
						<a href="list.bo?nowPage=${pi.nowPage-1}">[이전]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage-1}&keyField=${keyField}&keyWord=${keyWord}">[이전]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty keyField}">
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="list.bo?nowPage=${p}" style="color:orange">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="list.bo?nowPage=${p}">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyWord=${keyWord}" style="color:orange">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyWord=${keyWord}">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${pi.nowPage ne pi.totalPage}">
				<c:choose>
					<c:when test="${empty keyField}">
						<a href="list.bo?nowPage=${pi.nowPage+1}">[다음]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage+1}&keyField=${keyField}&keyWord=${keyWord}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>
</body>
</html>