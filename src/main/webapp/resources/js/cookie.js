function setCookie(name, value, day) {
	var date = new Date();
	date.setDate(date.getDate() + day);
	
	var willCookie = '';
	willCookie += name + '=' + encodeURIComponent(value) + ';';
	willCookie += 'expires=' +date.toUTCString() + '';
	
	document.cookie = willCookie;
}

function getCookie(name) {
	var cookies = document.cookie.split(';');
	
	for (var i in cookies) {
		if (cookies[i].search(name) != -1) {
			return decodeURIComponent(cookies[i].replace(name + '=', ''));
		}
	}
}

function removeCookie(name) {
	var date = new Date();
	date.setDate(date.getDate() - 1);
	
	var willCookie = '';
	willCookie += name + "=;";
	willCookie += 'expires' + date.toUTCString();
	
	document.cookie = willCookie;
}