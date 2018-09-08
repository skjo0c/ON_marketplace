// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
/* global $ */
$(document).ready(function(){
	
	$(function() {
	  setInterval(function(){
	    $('.alert').slideUp(500);
	  }, 1000);
	});

	function showUpdateBtn(){
		$(".update_cart").show();
	}
	$("#quantity").on("change", showUpdateBtn)
	
	
	$(".update_cart").on('click', function(){
		var item_id = document.getElementsByClassName("item_id")[0].innerHTML;
		var quantity = $("#quantity").val();
		$.ajax({
			type: "POST",
			url: "/cart/order_items",
		data: {quantity: quantity, item_id: item_id}
		});
		$(".update_cart").hide();
	});
	
	$('.multi-item-carousel').carousel({
	  interval: false
	});
	
	// for every slide in carousel, copy the next slide's item in the slide.
	// Do the same for the next, next item.
	$('.multi-item-carousel .item').each(function(){
	  var next = $(this).next();
	  if (!next.length) {
	    next = $(this).siblings(':first');
	  }
	  next.children(':first-child').clone().appendTo($(this));
	  
	  if (next.next().length>0) {
	    next.next().children(':first-child').clone().appendTo($(this));
	  } else {
	  	$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
	  }
	});

	function hideMultiItem(){
		$(".multiitem").hide();
	}
	$(".pagination").on("click", hideMultiItem)

});

