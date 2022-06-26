/* global $ */$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.your-class').slick({
      autoplay: true,
      autoplaySpeed: 3000,
      arrows: true,
      dots: true,
      speed: 1000,
    });
  });
});

