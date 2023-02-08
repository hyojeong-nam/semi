<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdaoheader" class="com.team4.member.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdtoheader" class="com.team4.member.MemberDTO" scope="session"></jsp:useBean>
<jsp:useBean id="bdtoheader" class="com.team4.bbs.BbsDAO" scope="session"></jsp:useBean>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
.openmenu {
	position: relative;
	display: inline-block;
}

.openmenu-btn{
	display:block;
}

.logintext{
	display:inline-block;
	font-size:15px;
	line-height:30px;
	margin: 15px;
}

.openmenu-content{
	display:none;
	position: absolute;
	z-index: 1;
	background-color:white;
	min-width: 150px;
	margin: 0px 0px;
}
.openmenu-content a{
	display:block;
	text-decoration: none;
	color: black;
	font-size: 12px;
	padding: 12px 20px;
}

.openmenu:hover .openmenu-content{
	display: block;
	margin: 0px 0px;
}

.openmenu-content a:hover{
	color: black;
	text-decoration: none;
	background-color : rgb(230,230,230);
}


.login {
	height: 100%;
}
/*
#keyword{
	border-bottom-color:transparent;
	outline:none;
	border:0px;
	width: 0px;
	background: transparent;
	color: white;
}
#status{
	visibility: hidden; 
}
#category{
	visibility: hidden;
}
.search:hover #status , .search:hover #category{
	visibility: visible;
}
.search:focus #status , .search:focus #category{
	visibility: visible;
}
*/
.search{
	border:2px solid;
	border-color: rgb(243,114,62);
	border-radius:5px;
	padding:5px;
	width: 454px;
	height: 30px;
	display: flex;
}
.search #keyword{
	width: 250px;
	outline:none;
	border:0px;
	font-size: 15px;
	color: #723838;
	font-weight: bold;
}

.search #status, .search #category{
	color: #723838;
	outline: none;
	border: 0px;
	width:80px;
	font-weight: bold;
}
.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48;
	font-size: 30px;
}
.material-symbols-outlined:hover {
	color: rgb(243,114,62);
}


</style>
<script>
function op() {
	document.getElementById('serch').submit();
}
</script>
<header class="header">
	<span class="login">
		<%
		int midx = 0;
		if (session.getAttribute("midx") == null || session.getAttribute("midx").equals("")
				|| session.getAttribute("midx").equals("0")) {
		%>
		<a class="logintext" href="/brick_market/member/login.jsp">로그인</a>
		<a class="logintext" href="/brick_market/member/join.jsp">회원가입</a>
		<%
		} else {
		midx = (Integer) session.getAttribute("midx");
		mdtoheader = mdaoheader.searchIdx(midx);
		%>
		<span class="logintext">
			<%=mdtoheader.getMember_nick()%>님 환영합니다
		</span>
		<nav class="openmenu">
			<span class="logintext openmenu-btn">
				<a href="/brick_market/member/myPage.jsp">마이페이지</a>
			</span>
			<div class="openmenu-content">
				<ul>
					<li><a href="/brick_market/member/myPage.jsp">마이페이지</a></li>
					<li><a href="/brick_market/bbs/myContent.jsp">등록한상품</a></li>
					<li><a href="/brick_market/bbs/likeList.jsp">관심글목록</a></li>
					<li><a href="/brick_market/member/pwdCheck.jsp">회원정보 수정</a></li>
				</ul>
			</div>
		</nav>
		<a class="logintext" href="/brick_market/member/logout.jsp">로그아웃</a>
		<%
		}
		%>
	</span>
	<a class="logo" href="/brick_market/index.jsp"><img 
		src="/brick_market/img/logo.png" alt="메인로고"></a>
	<div class="mypage">
	<a href="/brick_market/bbs/write.jsp">상품등록</a>
	</div>
	<form action="/brick_market/bbs/list.jsp" id="serch">
		<div class="search">
		<select name="status" id="status">
			<option value="0" selected="selected">판매중</option>
			<option value="1">예약 완료</option>
			<option value="2">거래 완료</option>
		</select>
		<select name="category" id="category">
			<option value="-1" selected="selected"><%=bdtoheader.stringCategory(-1)%></option>
			<option value="0"><%=bdtoheader.stringCategory(0)%></option>
			<option value="1"><%=bdtoheader.stringCategory(1)%></option>
			<option value="2"><%=bdtoheader.stringCategory(2)%></option>
			<option value="3"><%=bdtoheader.stringCategory(3)%></option>
			<option value="4"><%=bdtoheader.stringCategory(4)%></option>
		</select> 
		<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
		<a class="material-symbols-outlined" onclick="return op();">
		<span class="material-symbols-outlined">search</span>
		</a>
		</div>
	</form>
	<nav class="nav">
		<ul>
			<li><a href="/brick_market/bbs/list.jsp?status=0&category=0&keyword="><%=bdtoheader.stringCategory(0)%></a></li>
			<li><a href="/brick_market/bbs/list.jsp?status=0&category=1&keyword="><%=bdtoheader.stringCategory(1)%></a></li>
			<li><a href="/brick_market/bbs/list.jsp?status=0&category=2&keyword="><%=bdtoheader.stringCategory(2)%></a></li>
			<li><a href="/brick_market/bbs/list.jsp?status=0&category=3&keyword="><%=bdtoheader.stringCategory(3)%></a></li>
			<li><a href="/brick_market/bbs/list.jsp?status=0&category=4&keyword="><%=bdtoheader.stringCategory(4)%></a></li>
		</ul>
	</nav>
	<span class="report">
		<ul>
			<li><a>이용가이드</a></li>
		</ul>
	</span>
	<hr class="line">
</header>