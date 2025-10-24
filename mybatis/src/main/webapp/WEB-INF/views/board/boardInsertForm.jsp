<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">게시판 글쓰기</h2>
	
	<div align="center">
		<form action="boardInsert.bo" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="3" cols="38" name="content"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input name="writer" value="${loginUser.userId}" readonly></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="글쓰기"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>