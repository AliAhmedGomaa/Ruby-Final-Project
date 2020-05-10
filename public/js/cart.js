$(document).ready(function (e) {
	$('.quantity .pro-qty span').on('click', function (e) {
		let button = $(this);

		setTimeout(function () {
			button.parent().find('input[type="text"]').change();
		}, 50);
	});

	$('.quantity input[type="text"]').on('input change', function (e) {
		const quantity = +$(this).val() || 0;
		let price = 0;

		if (quantity)
			price = +$(this).closest('tr').find('.p-price').html().slice(1);

		const total = Math.round(quantity * price * 100.0) / 100.0;
		$(this).closest('tr').find('.total-price').html(`$${total}`);

		updateTotalPrice();
	});

	$('.close-td i').on('click', function (e) {
		$(this).closest('tr').remove();
		updateFirstRowClass();
		updateTotalPrice();
	});

	$('.up-cart').on('click', function (e) {
		e.preventDefault();

		localStorage.removeItem('cart');

		$('.cart-table tbody tr').each(function () {
			const id = +$(this).data('id');
			const quantity = +$(this).find('.quantity input[type="text"]').val();

			setItemQuantity(id, quantity);
		});
	});
});

function updateTotalPrice () {
	let subtotal = $('.subtotal span');
	let total = $('.cart-total span');
	let price = 0;

	$('.cart-table tbody tr').each(function () {
		price += +$(this).find('.total-price').html().slice(1);
	});

	price = Math.round(price * 100.0) / 100.0;

	subtotal.html(`$${price}`);
	total.html(`$${price}`);
}

function updateFirstRowClass () {
	$('.cart-table tbody tr').first().find('td').addClass('first-row');
}