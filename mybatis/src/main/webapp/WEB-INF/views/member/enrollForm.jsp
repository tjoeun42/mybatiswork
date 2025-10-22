<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Form</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<br>
		<h2 align="center">회 원 가 입</h2>
		<br>
		<form action="insert.me" method="post" id="enrollForm">
			<table align="center">
				<tr>
					<td>* ID</td>
					<td>
						<input type="text" name="userId" required>
						<div id="checkResult" style="font-size:0.8em; display:none"></div>
					</td>
				</tr>
				<tr>
					<td>* PWD</td>
					<td><input type="password" name="userPwd" required></td>
				</tr>
				<tr>
					<td>* NAME</td>
					<td><input type="text" name="userName" required></td>
				</tr>
				<tr>
					<td>&ensp; EMAIL</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>&ensp; BIRTHDAY</td>
					<td><input type="text" name="birthday" placeholder="생년월일(6자리)"></td>
				</tr>
				<tr>
					<td>&ensp; GENDER</td> 
					<td align="center">
						<input type="radio" name="gender" value="M">남
						<input type="radio" name="gender" value="F">여
					</td>
				</tr>
				<tr>
					<td>&ensp; PHONE</td>
					<td><input type="text" name="phone" placeholder="-포함"></td>
				</tr>
				<tr>
					<td>&ensp; ADDRESS</td>
					<td><input type="text" name="address"> </td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button type="reset">초기화</button>
				<button type="submit">회원가입</button>
			</div>
		</form>
		<br><br>
	</div>
</body>
</html>