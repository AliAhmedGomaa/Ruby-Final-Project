$(document).ready(function (e) {
	$('.add-to-cart').on('click', function (e) {
		e.preventDefault();

		const id = +$(this).data('id');
		const quantity = +$(this).data('quantity');
		
		addToCart(id, quantity);
	});

	$('.add-product-to-cart').on('click', function (e) {
		e.preventDefault();

		let quantityInput = $('.quantity input[type="text"]');

		if (quantityInput) {
			const id = +$(this).data('id');
			const quantity = +quantityInput.val();

			addToCart(id, quantity);
		}
	});
});

function addToCart (id, quantity) {
	if (id && quantity && id > 0 && quantity > 0) {
		let itemQuantity = getItemQuantity(id);

		setItemQuantity(id, quantity + itemQuantity);
	}
}

function getItemQuantity (id) {
	if (id && id > 0) {
		let cart = localStorage.getItem('cart');

		if (cart) {
			cart = JSON.parse(cart);

			let item = cart.find(item => 'id' in item && item.id === id);

			if (item && 'quantity' in item)
				return item.quantity
		}
	}

	return 0;
}

function setItemQuantity (id, quantity) {
	if (id && quantity && id > 0 && quantity > 0) {
		let cart = localStorage.getItem('cart') || '[{"id":2,"quantity":2}]';
		cart = JSON.parse(cart);

		let index = cart.findIndex(item => 'id' in item && item.id === id);

		if (index === -1) {
			cart.push({
				id: id,
				quantity: quantity
			});
		}
		else
			cart[index].quantity = quantity;

		cart.sort((a, b) => a.id - b.id);

		localStorage.setItem('cart', JSON.stringify(cart));
	}
}