<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.team4.bbs.BbsDAO" scope="session">
</jsp:useBean>
<%@page import="java.util.*"%>
<%@page import="com.team4.bbs.BbsDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css"
	href="/brick_market/css/maincss.css">
<style type="text/css">
section {
	width: 1200px;
}

section table img {
	width: 200px;
	margin: 10px;
	height: 220px;
}

section table {
	text-align: center;
	border: 0px;
	margin: auto;
}

section fieldset {
	border: 0px;
}

section legend {
	text-align: center;
}
</style>
<script type="text/javascript">
function date() {
	date=new Date();
}
</script>
</head>
<%
String page_s = request.getParameter("page");
if (page_s == null || page_s.equals("")) {
	page_s = "1";
}
int pagenum = Integer.parseInt(page_s);
int select = 3;
int totalcnt = bdao.getTotalCnt();
ArrayList<BbsDTO> arr = bdao.bbsList(1, pagenum, select);
%>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<article>
			<fieldset>
				<%
				if (pagenum <= 1) {
				%>왼쪽<%
				} else {
				%>
				<a href="index.jsp?page=<%=pagenum - 1%>">왼쪽</a>
				<%
				}
				%>
				<legend>최신글 보기</legend>
				<table>
					<%
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td>등록된 최신글이 없습니다</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<%
						for (int i = 0; i < arr.size(); i++) {
						%>
						<td><script>var str = '<%=arr.get(i).getBbs_date_s()%>';
						var strY=str.substring(0,4);
						var strM=parseInt(str.substring(5,7))-1;
						var strD=str.substring(8,10);
						var strH=str.substring(11,13);
						var strMi=str.substring(14,16);
						var strS=str.substring(17,19);
						var date=new Date(strY,strM,strD,strH,strMi,strS);
						var today=new Date();
						var dayma= today-date;
						if(dayma<60000){
							document.write('방금전');
						}else if(dayma<3600000){
							var mi=Math.floor(dayma/60000);
							document.write(mi+'분전');
						}else if(dayma<86400000){
							var h=Math.floor(dayma/3600000);
							document.write(h+'시간전');
						}else if(dayma<2592000000){
							var d=Math.floor(dayma/86400000);
							document.write(d+'일전');
						}else{
							document.write(str);
						}
						</script></td>
						<%
						}
						%>
					</tr>
					<tr>
						<%
						for (int i = 0; i < arr.size(); i++) {
						%>

						<td><img src="<%=arr.get(i).getBbs_img()%>"></td>

						<%
						}
						%>
					</tr>
					<tr>
						<%
						for (int i = 0; i < arr.size(); i++) {
						%>

						<td><%=arr.get(i).getBbs_subject()%></td>

						<%
						}
						%>
					</tr>
					<tr>
						<%
						for (int i = 0; i < arr.size(); i++) {
						%>

						<td><%=arr.get(i).getBbs_price()%></td>

						<%
						}
						%>
					</tr>
					<%
					}
					%>
				</table>
				<%
				if (pagenum >= totalcnt - select) {
				%>오른쪽<%
				} else {
				%>
				<a href="index.jsp?page=<%=pagenum + 1%>">오른쪽</a>
				<%
				}
				%>
			</fieldset>
		</article>

	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>