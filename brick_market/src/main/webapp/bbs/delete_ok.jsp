<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ddao" class="com.team4.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdto" class="com.team4.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>    

<%
int bbs_idx=Integer.parseInt(request.getParameter("bidx"));
int bbs_writer_idx=(int)session.getAttribute("midx");
String pwd=request.getParameter("password");
int result=ddao.bbsDelete(bbs_idx, bbs_writer_idx, pwd);

if(result==1){
	
	%>
	<script>
	window.alert("게시글 삭제 성공!");
	location.href="/brick_market/index.jsp";
	</script>
	<%		
	}else if(result==0){
			%>
			window.alert("비밀번호가 틀렸습니다.");
			location.href="/brick_market/bbs/content.jsp?bbs_idx=<%=bbs_idx %>";
			<% 
			}else{}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>