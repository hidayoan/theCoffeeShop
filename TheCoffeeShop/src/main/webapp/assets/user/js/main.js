/**
 * 
 */
var url = location.href;

if( url.indexOf("trang-chu") != -1){
	
	document.getElementById("trang-chu").classList.add("active");
}

if( url.indexOf("san-pham") != -1){
	document.getElementById("san-pham").classList.add("active");
}