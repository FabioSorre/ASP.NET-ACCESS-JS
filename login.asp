<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
  
<html lang="it">

<head>

	<title>  vendita articoli informatici </title>
	<meta name="author" content="Fabio Sorrentino">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<link rel="stylesheet"	type="text/css"	href="stile.css">
	
	<script type="text/javascript" src="script.js"></script>

</head>
  
<body>
	<div id="header">
	<p class="header">
	<% @language="JScript" %>			
	<%
	if(Session("nickname")==null){
		Response.write("anonimo");
	}else{
		Response.write("Utente: "+Session("nickname"));
	}
	%>
	</p>
	<h1> <!--#include file="./head.txt" --> </h1>
			
	</div>
	<div id="menu">
		<p><a href = home.asp> Home </a></p>
		<%
		if(Session("nickname")==null){
		%>
			<p><a href = login.asp>Login</a></p>
			<p><a href = prod.asp> Prodotti </a></p>
			<p><a href = car.asp> Carrello </a></p>
			<p>Logout</p>
		<%
		}else{
		%>
			<p>Login</p>
			<p><a href = prod.asp> Prodotti </a></p>
			<p><a href = car.asp> Carrello </a></p>
			<p><a href = logout.asp>Logout</a></p>
		<%
		}
		%>
	</div>
	
	<h2>PAGINA DI IDENTIFICAZIONE</h2>
	
	<div id="content">
				
		<form name="login" id="login" method="Post" action="logincheck.asp" onSubmit="return controllo()">
			<h2>Inserisca nickname e password per accedere</h2>
			
			<p>NICKNAME: <input type="text" name="nick" id="nick"  value="<%
																			if("nickname"==null)
																			{
																			Response.write("");
																			}
																			else
																			{
																			Response.write(Request.cookies("nickname"));
																			}
																			%>" >
			<p>PASSWORD: <input type="password" name="pass" id="pass" value="">
			
			<p><input type="reset" value="PULISCI"> <input type="submit" value="OK"> </p>
			
		</form>
		
	</div>

	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>	
</body>
</html>
