$(document).ready(function() {
    $('.removeBtn').click(function(){
        $(this).parents('#cartProduct').hide()

        let itemCount = $('#myCart .cart-count').text().match(/\d+/) - 1
        $('#myCart .cart-count').text( itemCount )
        $('header .cart-count').text( "(" + itemCount + ")" )
    });

    $('.add-to-cart').click(function (){
        console.log('Click!')
        $(this).parent().append($(
            "<div>Added to cart!</div>"
        ))
        $(this).hide()
    })
})
