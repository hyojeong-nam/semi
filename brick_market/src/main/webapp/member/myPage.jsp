<%@ page import="com.team4.review.ReviewDTO"%>
<%@ page import="org.apache.tomcat.websocket.Transformation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team4.member.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="com.team4.review.ReviewDTO"%>
<jsp:useBean id="mdao" class="com.team4.member.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="vdao" class="com.team4.review.ReviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css"
	href="/brick_market/css/maincss.css">
<style>
h2 {
	text-align: center;
}

table {
	text-align: center;
	margin: 0px auto;
}
table tr .l{
	text-align: left;
	line-height: 30px;
}

.profile_img {
	height: 150px;
	width: 150px;
	object-fit: cover;
	border:1px solid rgba(243,114,62,1);
}
</style>
<%
int user_idx = (int) session.getAttribute("midx");

if (session.getAttribute("midx") == null || session.getAttribute("midx").equals("")
		|| session.getAttribute("midx").equals("0")) {
%>
<script>
	window.alert('잘못된 접근입니다.');
	window.location.href = '/brick_market/index.jsp';
</script>
<%
return;
}
//멤버 idx 가져오기
MemberDTO dto = mdao.searchIdx(user_idx);

//회원 등급 판별
int level = dto.getMember_class();
String result = (level == 1) ? "관리자" : (level == 0) ? "일반회원" : "정지회원";

//이메일 아이디/주소 각각 추출하기
String email = dto.getMember_email();
int domain = email.indexOf("@");
String email_id = email.substring(0, domain);
String email2 = email.substring(domain + 1);

//가입일 date 형식 변경하기
Date original_date = dto.getMember_date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
String joindate =sdf.format(original_date);
%>

</head>
<style>
article.list div{
	margin:5px 0px;
	padding: 15px 0px;
}

article.list div:hover{
	background-color : rgba(243,114,62,0.3);
}

article.list a{
	color: black;
	text-decoration: none;
}

.content {
	display:flex;
    justify-content:center;
    align-items:flex-start;
	margin:0px 0px;
}

article.list{
	width:200px;
	display:inline-table;
	border:1px solid rgba(243,114,62,1);
}
article.info{
	width:500px;
	height:400px;
}

.mid hr{
	width:70%;
	height:2px;
	border:0px;
	background-color:rgba(243,114,62,1);
}

</style>
<body>
	<%@include file="/header.jsp"%>
	<section class="mid">
		<h2>마이 페이지</h2>
		<hr>
		<div class="content">
		<article class="list">
			<a href="/brick_market/member/myPage.jsp"><div>마이페이지</div></a>
			<a href="/brick_market/bbs/myContent.jsp"><div>등록한상품</div></a>
			<a href="/brick_market/bbs/likeList.jsp"><div>관심글목록</div></a>
			<a href="/brick_market/member/pwdCheck.jsp"><div>회원정보수정</div></a>
		</article>
		<article class="info">
			<table>
				<tr>
					<td><img class="profile_img" alt="profile" src="<%=dto.getMember_img()%>"><br> 
						</td>
					<td><%=dto.getMember_nick()%>님은 <%=result%>입니다.<br> 가입일: <%=joindate %>
						</td>
				</tr>
				<tr>
					<td >이름</td>
					<td class="l"><%=dto.getMember_name()%></td>
				</tr>
				<tr>
					<td >아이디</td>
					<td class="l"><%=dto.getMember_id()%></td>
				</tr>
				<tr>
					<td >비밀번호</td>
					<td class="l"><%=dto.getMember_pwd()%></td>
				</tr>
				<tr>
					<td >닉네임</td>
					<td class="l"><%=dto.getMember_nick()%></td>
				</tr>
				<tr>
					<td >이메일</td>
					<td class="l"><%=dto.getMember_email()%></td>
				</tr>
				<tr>
					<td >별점</td>
					<%	
					ArrayList<ReviewDTO> varr = vdao.selectReview(user_idx);
					if(varr == null || varr.size() == 0){
					%>
					<td class="l">남겨진 리뷰가 없습니다.</td>
					<%
					}else {
						int vsum = 0;
						int vcnt = 0;
						for(int i = 0; i < varr.size(); i++){
							vsum += varr.get(i).getReview_rate();
							vcnt ++;
						}
						double vavg = (double)vsum / vcnt;
						String star = "";
						if(vavg >= 4.5){
							star = "★★★★★";
						}else if(vavg >= 3.5){
							star = "★★★★☆";
						}else if(vavg >= 2.5){
							star = "★★★☆☆";
						}else if(vavg >= 1.5){
							star = "★★☆☆☆";
						}else{
							star = "★☆☆☆☆";
						}
						%>
						<td class="l"><%=star %>(<%=varr.size() %> 리뷰) 평점 <%=(double)Math.round((vavg*10))/10 %></td>
						<%
					}
					%>
				</tr>
			</table>
		</article>
		</div>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>