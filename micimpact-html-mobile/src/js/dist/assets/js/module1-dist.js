function test() {
  console.log('test');
}

test();

/*video js*/
var player = videojs('example-video', {
  hls: {
    withCredentials: true
  }
});

/*swiper-slide*/
var swiper = new Swiper('.mi-swiper-slide .swiper-container', {
  pagination: '.mi-swiper-slide .swiper-pagination',
  paginationClickable: true
});

