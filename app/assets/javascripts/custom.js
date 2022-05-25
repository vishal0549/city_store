Product = {
  init: function() {
    $('.product_offers .slider').slick({
        dots: false,
	infinite: true,
	speed: 700,
	cssEase: 'linear',
	arrows: true,
	autoplay: true,
	autoplaySpeed: 6000,
	prevArrow: '<i class="chevron circle left icon icon-prev big"></i>',
	nextArrow: '<i class="chevron circle right icon icon-next big"></i>'
    });
    $('.product_offers .cards').slick({
        dots: false,
	infinite: true,
	speed: 700,
	cssEase: 'linear',
	arrows: true,
	prevArrow: '<i class="chevron circle left icon icon-prev big"></i>',
	nextArrow: '<i class="chevron circle right icon icon-next big"></i>',
	slidesToShow: 6,
	slidesToScroll: 6,
        responsive: [{
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 4,
            infinite: true,
          }
        },
        {
          breakpoint: 800,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
     ]
    });
    $('.product-search').keydown(function (e){
      if(e.keyCode == 13){
	  window.location = $(this).attr('data_url') + '?term=' + $(this).val()
      }
    });
     $('input.product-search').autocomplete({
          minLength: 3,
	  source: '/prducts/search',
	 open: function( event, ui ) {
	     search_input = $('input.product-search')
	     $('ul.ui-autocomplete').append('<li data_url='+ search_input.attr('data_url')+ '?term=' + search_input.val() +'><a href="#" class="all_products"> View all products matching - '+ search_input.val() +'</a></li>')
	 }
      }).autocomplete('instance')._renderItem = function(ul, item) {
  return $('<li data_url='+ item.url +'></li>').data('item.autocomplete', item).append('<img src=' + item.image + '/><span class="product_name">' + item.name+ '</span><span>' + item.quantity + '</span><span>' + item.sale_price + '</span>').appendTo(ul);
      };
      $('ul.ui-autocomplete').on('click', 'li', function() {
	  console.log($(this).find('span').first().text())
	  window.location = $(this).attr('data_url')
      });

  }
};

$(document).ready(function() {
  return Product.init();
});
$(document).on('change', '.category_show input:checkbox', function(){
    var filters = [];
    $.each($( ".category_show input:checked" ), function(){ filters.push($(this).attr('name')); });
    var search_path = $('.category_sidebar').attr('data_url') + '?filters=' + filters
    $.get(search_path, 'html', function(data, status) {
	$('.category_show .ui.cards').html(data);
    })
});
