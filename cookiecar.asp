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

	<h2>ERRORE</h2>
	
	<div id="content">
	
		<%
		var con;
		var conString;
		con = Server.CreateObject("ADODB.Connection");
		conString = "Provider=Microsoft.Jet.OLEDB.4.0; "+"Data Source="+Server.MapPath("shop.mdb");
		con.Open(conString);
		var rst;
		var sSQLString;
		rst = Server.CreateObject("ADODB.Recordset");
		var nome=Request.form("n");
		var q=Request.form("q");
		
		sSQLString = "Select qty from prods where pname='"+nome+"'";
		rst = con.Execute(sSQLString);
		var test=/[^0-9]/;
		
		
		if(!test.test(q) && q<=rst("qty")){		
						
						Response.Cookies(Session("nickname"))(nome) = q;
	
						expire=new Date();
						expire.setDate(expire.getDate()+15);
						Response.Cookies(Session("nickname")).Expires=expire.getVarDate();
			
						
			rst.Close();
			con.Close();
			rst = null;
			con = null;
			
			Response.Redirect("car.asp");
		}
		else
		{
			rst.Close();
			con.Close();
			rst = null;
			con = null;
			
			%>	
		
		<p>Errore: la quantit&agrave; selezionata non &egrave; presente a magazzino.</p>
	
	<%
		}	
	%>
	</div>

	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>
</body>
</html>
