<!-- template.jsp -->
<%
String pageTitle = request.getParameter("pageTitle");
String pageContent = request.getParameter("pageContent");
%>

<div class="content">
    <h1><%= pageTitle %></h1>
    <p><%= pageContent %></p>
</div>
