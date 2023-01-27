<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css" href="../css/maincss.css">
<style>
table{
border-spacing: 10px;
margin-left:300px;
margin-right:auto;
}
h1{
text-align: center;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>

	<section>
		<form name="login" action="login_ok.jsp">
			<table>
			<tr>
			<td><h1>로그인</h1></td>
			</tr>
				<tr>
					<td>그림 <input type="text" name="id" placeholder="ID">
					</td>
				</tr>
				<tr>
					<td>열쇠 <input type="text" name="password" placeholder="PASSWORD">
					</td>
				</tr>
				<tr>
				<td><input type="submit" value="로그인"></td>
				</tr>
				<tr>
				<td><input type="button" value="아이디/비밀번호 찾기"></td>				
				</tr>
			</table>
		</form>
	</section>
		<%@include file="/footer.jsp"%>
</body>
</html>