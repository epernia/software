function setCookie(c_name,value,expiredays) {
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+ ";path=/"+
	((expiredays==null) ? "" : ";expires="+exdate);
}

function getCookie(c_name) {
	if (document.cookie.length>0) {
	  c_start=document.cookie.indexOf(c_name + "=")
	  if (c_start!=-1) { 
	    c_start=c_start + c_name.length+1;
	    c_end=document.cookie.indexOf(";",c_start);
	    if (c_end==-1) c_end=document.cookie.length;
  	    return unescape(document.cookie.substring(c_start,c_end))
	  } 
	}
	return null;
}

function removeLangCookie() {
	setCookie('language','',null);
	if( (end=url.indexOf('.html.'+lang)) == -1) end=url.length;
	window.location = url.substring(0,end) + '?';	
}

var lang = document.getElementsByTagName('html')[0].lang;
var url = window.location.toString();
// explicit change of language by clicking on a link
if(url.indexOf('.html.'+lang) != -1) {
   	setCookie('language', lang, 30);
}

function display_missing_translation_text()
{
	if (clang = getCookie('language')) {
		text = language_missing_text;
		document.write('<p>' + text + '</p>')
	}
}

function display_remove_cookie_text()
{
	if (clang = getCookie('language')) {
		document.write('<p>' + language_cookie_text + '</p>')
		document.write('<p><a href="/" onclick="removeLangCookie(); return true;">' + remove_cookie_text + '</a></p>');
	}
}
