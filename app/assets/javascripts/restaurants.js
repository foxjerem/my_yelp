$(document).ready(function(){

	var popUp = $('<div></div>')

	popUp.dialog({autoOpen: false, 
								modal: true,
								resizeable: false, 
								title: 'Add a new restaurant',
								minHeight: 250,
								minWidth: 400
	});

	$('#new-restaurant-link').on('click', function() {
		 popUpFormFrom('restaurants/new.html .restaurant-input-form', popUp);
	});

	$('.edit-restaurant-link').off().on('click', function() {
		 popUpFormFrom(this.href + '.html' + ' .restaurant-input-form', popUp);
	});

});

