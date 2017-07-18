$(document).ready(function(){
	// alert("1111")
	var slidey =$('.banner').unslider({
		speed: 500,               //  The speed to animate each slide (in milliseconds)
		delay: 1000,              //  The delay between slide animations (in milliseconds)
		complete: function() {
		},  //  A function that gets called after every slide animation
		keys: true,               //  Enable keyboard (left, right) arrow shortcuts
		dots: true,               //  Display dot navigation
		fluid: true              //  Support responsive design. May break non-responsive designs
	});

	 data = slidey.data('unslider');
	function hello(){


		//  Start Unslider
		data.start();
	} 

	window.setInterval(hello,2000); 
});



//  Pause Unslider
//data.stop();

//  Move to a slide index, with optional callback
//data.move(2, function() {});
//  data.move(0);

//  Manually enable keyboard shortcuts
//data.keys();

//  Move to the next slide (or the first slide if there isn't one)
//data.next();

//  Move to the previous slide (or the last slide if there isn't one)
//data.prev();

//  Append the navigation dots manually
//data.dots();