<!DOCTYPE HTML PUBLIC
  "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
  
<html lang="it">

<head>

	<title>  vendita articoli informatici </title>
	<meta name="author" content="Fabio Sorrentino">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<link rel="stylesheet"	type="text/css"	href="stile.css">

<script type="text/javascript">
function controllo(a){

var test=/[^0-9]/;

if(test.test(a)){
window.alert("Errore: la quantità inserita deve essere numerica!")
return false;
}
return true

}
</script>	
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
		<h1><!--#include file="./head.txt" --></h1>
				
	</div>
	
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

	<h2>ELENCO PRODOTTI</h2>
	
	<div id="content">
	<%
	if(Session("nickname")==null){
	%>
		<table>
		<tr><th>Nome prodotto</th></tr>
		<%
        while (!rst.EOF){
		Response.write("<tr><td>"+rst("pname")+"</td></tr>"); 
		rst.MoveNext();
		}
		%>
		</table>
	<%
	}
	else{
	%>
	
	<table>
	
		<tr><th>Nome prodotto</th><th>Quantit&agrave; disponibile</th><th>Prezzo *</th><th>Quantit&agrave; ordinata</th></tr>
		<%
		while (!rst.EOF){

		Response.write("<tr><td> " + rst("pname") + 
						"</td><td class='qcont'>" + rst("qty") + 
						"</td><td>" + (parseFloat(rst("price")/100)).toFixed(2)+ " &euro;"); 
		Response.Write("</td><td>" + "<form method=\"post\" action=\"cookiecar.asp\" onSubmit=\"return controllo(q.value)\">");
		Response.Write("<input type=\"hidden\" name=\"n\" value=\""+rst("pname")+"\"> <input type='text' name='q'>" + "<input type='submit' value='SELEZIONA'> </form>" + "</td></tr>"); 
		rst.MoveNext();
		}
		rst.Close();
        con.Close();
        rst = null;
        con = null;
	%>
	
	</table>
	<p>* i prezzi indicati sono unitari.</p>
	<%
	}	
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
    sSQLString = "SELECT * FROM users WHERE nick='"+Session("nickname")+"' AND admin=true ;"
    rst = con.Execute(sSQLString);
	if(!rst.EOF){
	
	%>
	<form name="nprod" method="POST" action="aggiungi.asp">
		<h3>Inserisci un nuovo prodotto:</h3>
		
		<table>	
			<tr><th>Nome prodotto</th><th>Costo **</th><th>Quantit&agrave; disponibile</th></tr>
			
				<tr>			
					<td><input type='text' name='NP' id="NP" size=20></td>
					<td><input type='text' name='C' id="C" size=8></td>
					<td><input type='text' name='Q' id="Q" size=18></td>
									
				</tr>
		</table>
		<p>** inserire i prezzi in centesimi di Euro</p>
			<p><input type="submit" value="AGGIUNGI PRODOTTO"></p> 
	</form>
	
	<form name="eprod" method="POST" action="elimina.asp">
		<h3>Elimina il prodotto dal listino selezionandone il nome dal men&ugrave; a tendina:</h3>
		
		<select name="P" id="P">
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
							
								while (!rst.EOF){
								Response.write("<option>" + rst("pname") + "</option>"); 
								rst.MoveNext();
								}
								rst.Close();
								con.Close();
								rst = null;
								con = null;
							%>	
		</select>
			<p><input type="submit" value="ELIMINA PRODOTTO"></p>
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
