/**
 * 
 */
// scroll body

window.onscroll = function() { myFunction() };

var t = document.getElementsByClassName("line_after_heading");

function getPosition(element) {
	var xPosition = 0;
	var yPosition = 0;

	while (element) {
		xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
		yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
		element = element.offsetParent;
	}

	return yPosition;
}

function myFunction() {
	for (var i = 0; i < t.length; i++) {
		
		if (document.body.scrollTop >= (getPosition(t[i]) - 100 ) || document.documentElement.scrollTop >= (getPosition(t[i]) - 100 )) {
			document.getElementsByClassName("menu_scroll_link")[i].classList.add("active");
			
			for(var j = 0; j < t.length; j++){
				if(i !== j){
					document.getElementsByClassName("menu_scroll_link")[j].classList.remove("active");
				}
			}
		}
	}

}


// 


