

var sub = document.querySelectorAll('.carousel-inner');	

for (var i = 0; i < sub.length; i++) {
	var iner = sub[i].nextElementSibling;
	iner.style.display = 'none'
	var tagged = sub[i].getElementsByTagName('a');
    for (var a = 0; a < tagged.length; a++) {
    	tagged[a].style.display = 'none'
    }


}

var slideIndex = 0;

var skul =setInterval(function(){ rool() }, 6000);
function StopFunc() {
    clearInterval(skul);
}
//rool();
//showSlides();

var card =  document.getElementsByClassName('card-body');

/*	cards = card[i];
	showSlides(cards)
	//console.log(cards.getElementsByClassName("carousel-item"))
}*/


function rool(){
	setInterval(function(){showSlides('card-body',1);
			showSlides('card-body',2);},3000);
	setInterval(function(){showSlides('card-body',3);
			showSlides('card-body',4);},3000);
	setInterval(function(){showSlides('card-body',5);
			showSlides('card-body',6);},6000);
}

function showSlides(klass,numberr) {

	var cards =  document.getElementsByClassName(klass)[numberr];
    var slides = cards.getElementsByClassName("carousel-item");
    var dots = cards.getElementsByClassName("dot");
    for (var i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    //setTimeout(showSlides, 1000); // Change image every 2 seconds
}


/*function showSlides() {
    
    var cards = document.getElementsByClassName('card-body')
    //var slides = cards.getElementsByClassName("carousel-item")
    for (var i = 1; i < cards.length; i++) {
    	var slides = cards[i].getElementsByClassName('carousel-item');
        //var dots[i] = document.getElementsByClassName("dot");
        for (var a = 0; a < slides.length; a++) {
        slides[a].style.display = "none"; 
	    }
	    slideIndex++;
	    if (slideIndex > slides.length) {slideIndex = 1}    
	    //for (i = 0; i < dots.length; i++) {
	        //dots[i].className = dots[i].className.replace(" active", "");
	    //}
	    //console.log(slides)
	    slides[slideIndex-1].style.display = "block";  
	    //dots[slideIndex-1].className += " active";
	    // Change image every 2 seconds
	}
   setTimeout(showSlides, 2000);  
}*/
    
  

/*var cards = document.getElementsByClassName('card-body')
var slideIndex = 0;
console.log(cards[2]);*/




function runs(event) {

	var aim = (event.target);
	aim = aim.parentElement.parentElement.parentElement;
	var aim1 = aim.children[0].children[0].nextElementSibling;

	var aimP = aim.children[0].children[0].getElementsByTagName('a');
	for (var a = 0; a < aimP.length; a++) {
    	aimP[a].style.display = 'block'
    }

	aim1.style.display = 'block'

	/*var rife = event.target.parentElement.getElementsByClassName('carousel-item');
	var dot = aim1.parentElement.parentElement.getElementsByClassName('dot');
	for (var i = 0; i < rife.length; i++) {
	      rife[i].className = rife[i].className.replace("carousel-item", "mySlides");
	      console.log(rife);
	}



	for (i = 0; i < dot.length; i++) {
	      dot[i].className = dot[i].className.replace(" active", "");

	  }
	var slideIndex = 1;

	rife[slideIndex-1].style.display = "block";
	dot[slideIndex-1].className += " active";*/
	var rife = event.target.parentElement.getElementsByClassName('carousel-item');
	var dot = aim1.parentElement.parentElement.getElementsByClassName('dot');
	

    var neww = aim.children[0].children[0].getElementsByClassName('prev')
    var newp = aim.children[0].children[0].getElementsByClassName('next')
    //console.log(neww[0])
    neww[0].addEventListener('click',plusSlides);
    newp[0].addEventListener('click',plossSlides);
    dot[0].addEventListener('click',currentSlide1);
    dot[1].addEventListener('click',currentSlide2);
    dot[2].addEventListener('click',currentSlide3);
    //console.log(neww);
    var slideIndex = 1;
	showSlides(slideIndex);

    function plusSlides() {
    	var n = -1;
	  showSlides(slideIndex += n);
	}
	
    function plossSlides() {
    	var n = 1;
	  showSlides(slideIndex += n);
	}

	function currentSlide1() {
		var n=1;
	  showSlides(slideIndex = n);
	}

	function currentSlide2() {
		var n=2;
	  showSlides(slideIndex = n);
	}

	function currentSlide3() {
		var n=3;
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {

	  for (var i = 0; i < dot.length; i++) {
	      dot[i].className = dot[i].className.replace(" active", "");

	  }

	  if (n > rife.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = rife.length}
	  for (var i = 0; i < rife.length; i++) {
	   
	      rife[i].style.display = 'none';   
	  }
	  //console.log(rife)
	  rife[slideIndex-1].style.display = "block";
	  dot[slideIndex-1].className += " active";
	}
	
	
	/*aim.children[0].children[0].children[0];
	var But = document.createElement('div');
	var d1 = document.createElement('span');
	var d2 =  document.createElement('span');
	var d3 =  document.createElement('span');
	d1.addEventListener("click", displayDate)



	But.innerHTML =  '<div class="form "style="background-color:grey;text-align:center">'+
	                             '<span class="dot" onclick="currentSlide(1)"></span>'+
	                             '<span class="dot" onclick="currentSlide(2)"></span>'+
	                             '<span class="dot" onclick="currentSlide(3)"></span>' +
		                          '</div>';
   
	aimP.appendChild(But);*/	 
	//console.log(aim1);                       
}

function run (event) {
	console.log(event.srcElement);
	aimP = event.srcElement;


	//var aim = (event.target);
	var aimP = event.target.parentElement.parentElement.parentElement;
	
	var liks = aimP.getElementsByTagName('a');
	var mov = aimP.getElementsByClassName('dot');
	//console.log(mov)
	
	for (var a = 0; a < liks.length; a++) {
    	liks[a].style.display = 'none'
    }
    mov[0].parentNode.style.display = 'none'
    
   


}

//window.onload=slideit;
		






