$(document).ready(function (e) {
	let cart = getCart();

	if (cart.length > 0) {
		fetch('products', {
			method: 'POST',
			headers: {
				'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ ids: cart.map(item => item.id) })
		}).then(response => response.json()).then(data => {
			let table = $('.cart-table tbody');

			data.products.forEach((product, index) => {
				const quantity = cart[index].quantity;
				const total = Math.round(product.price * quantity * 100) / 100;
				const className = index == 0 ? 'first-row' : '';
				const imagePath = product.images.length > 0 ? product.images[0].path.url : '/img/product-default.png';
				table.append(`
					<tr data-id="${product.id}">
						<td class="cart-pic ${className}">
							<img src="${imagePath}" width="170" height="170" alt="${product.title}">
						</td>
						<td class="cart-title ${className}">
							<h5>${product.title}</h5>
						</td>
						<td class="p-price ${className}">$${product.price}</td>
						<td class="qua-col ${className}">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="${quantity}">
								</div>
							</div>
						</td>
						<td class="total-price ${className}">$${total}</td>
						<td class="close-td ${className}"><i class="ti-close"></i></td>
					</tr>
				`);
			});

			updateTotalPrice();

			let proQty = $('.pro-qty');
			proQty.prepend('<span class="dec qtybtn">-</span>');
			proQty.append('<span class="inc qtybtn">+</span>');

			proQty.on('click', '.qtybtn', onQuantitySpanClick);
			$('.quantity input[type="text"]').on('input change', onQuantityInputChange);
			$('.close-td i').on('click', onItemDeleteClick);
		});
	}

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

function onQuantitySpanClick () {
	var $button = $(this);
	var oldValue = $button.parent().find('input').val();

	if ($button.hasClass('inc'))
		var newVal = parseFloat(oldValue) + 1;
	else {
		if (oldValue > 0)
			var newVal = parseFloat(oldValue) - 1;
		else
			newVal = 0;
	}

	$button.parent().find('input').val(newVal);
	$button.parent().find('input').change();
}

function onQuantityInputChange () {
	const quantity = +$(this).val() || 0;
	let price = 0;

	if (quantity)
		price = +$(this).closest('tr').find('.p-price').html().slice(1);

	const total = Math.round(quantity * price * 100.0) / 100.0;
	$(this).closest('tr').find('.total-price').html(`$${total}`);

	updateTotalPrice();
}

function onItemDeleteClick () {
	$(this).closest('tr').remove();
	updateFirstRowClass();
	updateTotalPrice();
}

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

function getCart () {
	let cart = localStorage.getItem('cart') || '[]';
	cart = JSON.parse(cart);
	cart = cart.filter(item => 'id' in item && 'quantity' in item);
	cart = cart.filter(item => item.id && item.quantity && item.id > 0 && item.quantity > 0);

	return cart;
}