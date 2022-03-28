$(document).ready(function() {

    $('.removeBtn').click(function(){
        let itemCount = $('#myCart .cart-count').text().match(/\d+/) - 1
        $(this).parents('#cartProduct').hide()
        $('#myCart .cart-count').text( itemCount )
        $('header .cart-count').text( "(" + itemCount + ")" )
    });

    $('.add-to-cart').click(function (){
        let itemCount = parseInt($('header .cart-count').text().match(/\d+/)) + 1
        $('header .cart-count').text( "(" + itemCount + ")" )
        $(this).parent().prepend($("<div>Added to cart!</div>"))
        $(this).hide()
    })
})
