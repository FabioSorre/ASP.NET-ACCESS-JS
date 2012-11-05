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
		<!--#include file="adojavas.inc"-->
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

	<h2>ACQUISTO COMPLETATO CON SUCCESSO</h2>
	
	<div id="content">
		<%
		var con;
		var conString;
		con = Server.CreateObject("ADODB.Connection");
        conString = "Provider=Microsoft.Jet.OLEDB.4.0; "+"Data Source="+Server.MapPath("shop.mdb");
        con.Open(conString);
        var sSQLString;
		
		e = new Enumerator(Request.Cookies(Session("nickname")));
			
		for(;!e.atEnd();e.moveNext()){
	
			sSQLString = "UPDATE prods SET qty = qty - "+ Request.Cookies(Session("nickname"))(e.item())+" WHERE pname='"+ e.item()+"'";
			con.Execute(sSQLString);
			Response.Cookies(Session("nickname"))(e.item) = 0;
		}
		con.Close();
		con = null;
		
		Response.write( "<p>Congratulazioni " +Session("nickname")+ " il suo acquisto &egrave; avvenuto con successo!</p> <p>La ringraziamo di aver acquistato sul nostro sito.</p> <p>Computer Melody</p>");
		%> 
	</div>
	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>
</body>
</html>
