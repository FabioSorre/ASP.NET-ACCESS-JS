
function controllo()
{  
	nick=document.getElementById("nick").value;
	pass=document.getElementById("pass").value;
	
 
	var regexp=/^[a-zA-Z]{4,}$/;
 
	if(/[a-zA-Z!0-9]{3,6}$/.test(nick) && /^[a-zA-Z!]/.test(nick) && /[A-Za-z]/.test(nick) && /[0-9]/.test(nick) && regexp.test(pass)==true)
	{
		return true;
	}else{
		if(/[a-zA-Z!0-9]{3,6}$/.test(nick)!=true ){
		window.alert("ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell’utente puo' contenere solo caratteri alfabetici o numerici o il simbolo '!', deve essere lungo da un minimo di tre ad un massimo di sei caratteri");
		return false;
		}
		if(/^[a-zA-Z!]/.test(nick)!=true ){
		window.alert("ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell’utente deve iniziare con un carattere alfabetico o con '!'");
		return false;
		}
		if( (/[A-Za-z]/.test(nick)!=true || /[0-9]/.test(nick)!=true ){
		window.alert("ATTENZIONE!! Inserito NICKNAME errato! Il nickname dell’utente deve contenere almeno un carattere non numerico ed uno numerico.");
		return false;
		}
		
		if(regexp.test(pass)!=true ){
		window.alert("ATTENZIONE!! Inserita PASSWORD errata! La password deve contenere solo caratteri alfabetici e deve essere lunga almeno quattro caratteri.");
		return false;
		}
	}  
}