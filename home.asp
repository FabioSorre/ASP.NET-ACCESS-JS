<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
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
	
	<h2>HOME PAGE</h2>
	
	<div id="content">
		<p>Benvenuti in Computer Melody sito E-commerce di prodotti informatici. </p>
		<p>All'interno del sito si possono trovare molti prodotti informatici di varie tipologie e marche. </p>
		<p>Si po&ugrave; visualizzare il catalogo dei nostri prodotti con un semplice click sull'icona "Prodotti" nel men&ugrave; qui a lato.</p>
		<p>Acquistare su Computer Melody &egrave; semplice e sicuro!! basta seguire i seguenti passi:</p>
		<ul>
		<li>Autenticarsi nella pagina denominata "Login"</li>
		<li>Selezionare dalla tabella prodotti l'oggetto e la quantit&agrave; che si stava cercando</li>
		<li>Verificare che nel carrello siano presenti le quantità selezionate</li>
		<li>In fine premere il pulsante "ACQUISTA"</li>
		<li>Dopodich&egrave; non vi resta che aspettare comodi perch&egrave; nel giro di 24 ore gli oggetti da voi ordinati vi saranno recapitati a casa tramite corriere espresso.</li>
		</ul>
	
	<h3>Domande Frequenti</h3>
		<p class="faq">D1:"Come mai non riesco a visualizzare il prezzo dei prodotti?"</p>
		<p class="faq">R1: Vi ricordiamo che per visualizzare le informazioni complete dei nostri prodotti &egrave; necessario essere iscritti e loggati. </p>
		<p class="faq">D2:"Dopo 24 ore, la merce che ho ordinato non &egrave; ancora arrivata, cosa faccio?"</p>
		<p class="faq">R2: Se la merce ordinata non arriva entro le 36 ore successive all'ordine, contattare il numero verde 800-000000.</p>
		<p class="faq"></p>
		
		
	</div>
	
	<div id="footer">
		<!--#include file="./foot.txt" -->
	</div>
</body>
</html>