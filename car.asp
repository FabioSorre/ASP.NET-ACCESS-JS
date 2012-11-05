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

	<h2>CARRELLO</h2>
	
	<div id="content">
	<%
	if(Session("nickname")==null){
	%>
		<h2>Attenzione! il carrello &egrave; disponibile solo per gli utenti autenticati.</h2>
		
	<%
	}
	else{
	%>
	
		<%
		var con;
		var conString;
		con = Server.CreateObject("ADODB.Connection");
		conString = "Provider=Microsoft.Jet.OLEDB.4.0; "+"Data Source="+Server.MapPath("shop.mdb");
		con.Open(conString);
		var rst;
		var sSQLString;
		rst = Server.CreateObject("ADODB.Recordset");
		sSQLString = "Select * from prods";
		rst = con.Execute(sSQLString);
		%>
		
			<table>
			<tr><th>PID</th><th>Nome</th><th>Prezzo</th><th>Quantit&agrave; ordinata </th><th>Totale</th> </tr>
			
			<%
			e = new Enumerator(Request.Cookies(Session("nickname")));
			var costo=0;
			var errore=0;
			
			for(;!e.atEnd();e.moveNext()){	
			
				if(Request.Cookies(Session("nickname"))(e.item())>0){
			
					sSQLString = "Select * from prods where pname='"+e.item()+"'";
					rst = con.Execute(sSQLString);
					if(rst.EOF){
						Response.write("<tr><td colspan=\"4\">Il prodotto selezionato non &egrave; pi&ugrave; presente nel database.</td></tr>")
					}else{
						car=(parseFloat(rst("price")))*parseInt(Request.Cookies(Session("nickname"))(e.item()));
						
						Response.write("<tr><td>" + rst("pid") +" </td>"+
						"<td>" + rst("pname") + "</td>"+
						"<td>" + (parseFloat(rst("price")/100)).toFixed(2) + " &euro;" + "</td>"+
						"<td class='qcont'>" + Request.Cookies(Session("nickname"))(e.item()) + "</td>" +
						"<td>" + (parseFloat(car)/100).toFixed(2) + " &euro;" + "</td>" +
						"<td>" + 
						"<form method='post' action='cancella.asp'><input type='hidden' name='n' value='"+e.item()+"'><input type='submit' value='CANCELLA'></form>" + "</td>" +
						"</tr>");
						costo=costo+car;
						}
					}
			}
			rst.Close();
			con.Close();
			rst = null;
			con = null;
			%>	
			</table>
			<%
			
				Response.Write("<h2>Totale carrello:" + " " + (parseFloat(costo)/100).toFixed(2) + " &euro;" + "</h2>");
			%>
			<form name="spesa" method="post" action="grazie.asp">
				
			<p><input type="submit" name="spesa" value="ACQUISTA"></p>
		</form>
			
		<%
		}
	%>
	</div>

	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>
</body>
</html>
