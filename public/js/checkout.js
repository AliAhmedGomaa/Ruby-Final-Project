$(document).ready(function (e) {
	if ($('.alert.alert-success').length > 0)	// If server send order is placed message
		localStorage.removeItem('cart');
	else {
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
				let table = $('.order-table');
				let total = 0;

				if (table.length > 0) {
					for (let i = 0; i < data.products.length; i++) {
						const name = data.products[i].title;
						const quantity = cart[i].quantity;
						const price = Math.round(data.products[i].price * quantity * 100) / 100;
						total += price;

						table.append(`<li class="fw-normal">${name} x ${quantity} <span>$${price}</span></li>`);
					}

					total = Math.round(total * 100) / 100;
					table.append(`
						<li class="fw-normal">Subtotal <span>$${total}</span></li>
						<li class="total-price">Total <span>$${total}</span></li>
					`);
					$('.checkout-form input[name="order[cart]"]').val(JSON.stringify(cart));
				}
			});
		}
	}
});

function getCart () {
	let cart = localStorage.getItem('cart') || '[]';
	cart = JSON.parse(cart);
	cart = cart.filter(item => 'id' in item && 'quantity' in item);
	cart = cart.filter(item => item.id && item.quantity && item.id > 0 && item.quantity > 0);

	return cart;
}