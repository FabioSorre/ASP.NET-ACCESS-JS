<!DOCTYPE HTML PUBLIC
  "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
  
<html lang="it">

<head>
	
	<title>  vendita articoli informatici </title>
	<meta name="author" content="Fabio Sorrentino">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<link rel="stylesheet"	type="text/css"	href="stile.css">
		
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
	<%
	var con;
	var conString;
	con = Server.CreateObject("ADODB.Connection");
	conString = "Provider=Microsoft.Jet.OLEDB.4.0; "+"Data Source="+Server.MapPath("shop.mdb");
	con.Open(conString);
	
	var nickname = String(Request.form("nick"));
	var password = String(Request.form("pass"));
	
	var regexp=/^[a-zA-Z]{4,}$/;
	if(/[a-zA-Z!0-9]{3,6}$/.test(nickname) && /^[a-zA-Z!]/.test(nickname) && /[A-Za-z]/.test(nickname) && /[0-9]/.test(nickname) && regexp.test(password)==true)
	{
	var rst;
    var sSQLString;
    rst = Server.CreateObject("ADODB.Recordset");
    sSQLString = "SELECT * FROM users WHERE nick='"+nickname+"' AND pass='"+password+"'";
    rst = con.Execute(sSQLString); 
	if (!rst.EOF){
		Response.Cookies("nickname")=nickname;
		Session("nickname") = nickname;
		rst.Close( );
		con.Close( );
		rst = null;
		con = null;
		expire=new Date();
		expire.setDate(expire.getDate()+21);
		Response.Cookies("nickname").Expires=expire.getVarDate();
		Response.Redirect("prod.asp");
		}
			else
			{
			Response.Write("<p>NICKNAME o PASSWORD inseriti sono errati!</p>");
			}
		
	}else{
		if(/[a-zA-Z!0-9]{3,6}$/.test(nickname)!=true ){
		Response.write("<p>ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell'utente puo' contenere solo caratteri alfabetici o numerici o il simbolo '!', deve essere lungo da un minimo di tre ad un massimo di sei caratteri</p>");
		
		}
		if(/^[a-zA-Z!]/.test(nickname)!=true ){
		Response.write("<p>ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell'utente deve iniziare con un carattere alfabetico o con '!'</p>");
		
		}
		if (/[A-Za-z]/.test(nickname)!=true || /[0-9]/.test(nickname)!=true ){
		Response.write("<p>ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell'utente deve contenere almeno un carattere non numerico ed uno numerico.</p>");
		
		}
		
		if(regexp.test(password)!=true ){
		Response.write("<p>ATTENZIONE!! Inserita PASSWORD errata! La password deve contenere solo caratteri alfabetici e deve essere lunga almeno quattro caratteri.</p>");
		
		}
	}  

	%>
	
	</div>
	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>
</body>
</html>

