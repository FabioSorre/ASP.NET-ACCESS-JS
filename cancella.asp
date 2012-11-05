<% @language="JScript" %>
		<!--#include file="adojavas.inc"-->
		<%
		
		var nome=Request.form("n");
		
		Response.Cookies(Session("nickname"))(nome) = 0;
		
		Response.Redirect("car.asp");
		
		%>