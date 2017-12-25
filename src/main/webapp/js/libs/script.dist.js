

/*video js*/
(function($) {
  if (!$("#hls-video").length) return;
  
  $(window).on("load", function() {
	  var player = videojs('hls-video', {
	    hls: {
	      withCredentials: true
	    }
	  });
  }); 
})(jQuery);


/*swiper-slide*/
(function($) {
  if (!$(".mi-swiper-slide").length) return;

  var swiper = new Swiper('.mi-swiper-slide .swiper-container', {
    pagination: '.mi-swiper-slide .swiper-pagination',
    paginationClickable: true
  });
})(jQuery);

//@prepros-prepend modules/*.js


$(window).on("load", function() {		
	setTimeout(function() {
		$("iframe").each(
		     function(index, elem) {
		         elem.setAttribute("webkit-playsinline","true");
		     }
		 );
		
		$("video").each(
			     function(index, elem) {
			         elem.setAttribute("webkit-playsinline","true");
			     }
			 );
		//var videoElement = document.createElement( 'video' );
		//videoElement.setAttribute('webkit-playsinline', 'webkit-playsinline');
	}, 20);

	
});

