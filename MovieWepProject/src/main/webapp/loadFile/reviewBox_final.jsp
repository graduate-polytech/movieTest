<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%

Object useridobj = session.getAttribute("userId");
String session_userid = useridobj == null ? "" : (String) useridobj;

String param_type = request.getParameter("param_type");
param_type = param_type==null?"":param_type;

String param_no = request.getParameter("param_no");
param_no = param_no==null?"":param_no;

String param_docid = request.getParameter("param_docid");
param_docid = param_docid==null?"":param_docid;

String param_title = request.getParameter("param_title");
param_title = param_title==null?"":param_title;

String param_userid = request.getParameter("param_userid");
param_userid = param_userid==null?"":param_userid;

String param_score = request.getParameter("param_score");
param_score = param_score==null?"":param_score;

String param_review = request.getParameter("param_review");
param_review = param_review==null?"":param_review;

String param_date = request.getParameter("param_date");
param_date = param_date==null?"":param_date;

%>
</head>
<body>
<div class="reviewDivBox">
			<div class="review_Top">
			<%
			if(!param_type.equals("movie")){
				String href="MovieInfoOfMovieSeq.jsp?DOCID="+param_docid+"&title="+param_title; %>
				<a href="<%=href %>">
				<p><b><%=param_title%></b></p>
				</a><%
				} else {%>
				<p><b><%=param_userid%></b></p>
				<%}%>
				<jsp:include page="ShowStarImg.jsp">
					<jsp:param name="score" value="<%=param_score%>" />
				</jsp:include>
				<%
				if (param_userid.equals(session_userid) || param_userid.equals("admin")) {
				%>
				<button type="button" class="btn btn-primary review_editBtn" data-message="수정"
				data-no="<%=param_no%>" data-DOCID="<%=param_docid%>"
				data-DBTitle="<%=param_title%>" data-DBUserid="<%=param_userid%>" data-score="<%=param_score%>"
				data-date="<%=param_date%>" data-review="<%=param_review%>">수정</button>
				<%
				}
				%>
			</div>
			<p class="review_Text">
				<%=param_review%>
			</p>
		</div>
</body>
</html>