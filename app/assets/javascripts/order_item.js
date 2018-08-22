$(document).ready(function(){
	$("#quantity").on('change',function(){
		var item_id = document.getElementsByClassName("item_id")[0].innerHTML;
		var quantity = $(this).val();
		$.ajax({
			type: "POST",
			url: "/cart/order_items",
		data: {quantity: quantity, item_id: item_id}
		});
	});
});