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
				<c:choose>
					<c:when test="${loginUser != null}">
						<form id="rFrm">
							<tr>
								<th width="80px">댓글작성</th>
								<th width="340px"><textarea rows="3" cols="45" name="centent"></textarea></th>
								<th width="80px"><input type="button" value="댓글작성" id="replyInsert"></th>
							</tr>
						</form>
					</c:when>
					<c:otherwise>
						<tr>
							<th width="80px">댓글작성</th>
							<th width="320px"><textarea rows="3" cols="45" readonly>로그인 후 이용 가능한 서비스입니다.</textarea></th>
							<th width="100px"><input type="button" value="댓글작성" disabled></th>
						</tr>
					</c:otherwise>
				</c:choose>
			</thead>
			<tbody>
				<c:forEach var="r" items="${rlist}">
					<tr>
						<td>${r.replyWriter}</td>
						<td>${r.replyContent}</td>
						<td>${r.createDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="paging-area" align="center">
			<c:if test="${rpi.nowPage ne 1}">
				<a href="detail.bo?nowPage=${rpi.nowPage-1}&bno=${b.boardNo}">[이전]</a>
			</c:if>
			<c:forEach var="p" begin="${rpi.startPage}" end="${rpi.endPage}">
				<c:choose>
					<c:when test="${p eq rpi.nowPage}">
						<a href="detail.bo?nowPage=${p}&bno=${b.boardNo}" style="color:orange">[${p}]</a>
					</c:when>
					<c:otherwise>
						<a href="detail.bo?nowPage=${p}&bno=${b.boardNo}">[${p}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${rpi.nowPage ne rpi.totalPage}">
				<a href="detail.bo?nowPage=${rpi.nowPage+1}&bno=${b.boardNo}">[다음]</a>
			</c:if>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>