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

$(document).ready(function(){
	$("#quantity").on('change',function(){
		debugger;
		var item_id = document.getElementsByClassName("item_id")[0].innerHTML;
		var quantity = $(this).val();
		$.ajax({
			type: "POST",
			url: "/cart/order_items",
		data: {quantity: quantity, item_id: item_id}
		});
	});
});