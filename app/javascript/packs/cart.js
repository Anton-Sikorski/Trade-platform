$(document).ready(function() {
    $('#removeBtn').click(function(){
        console.log('Click!');
        $(this).parents('#cartProduct').hide()
    })

    $('#buyBtn').click(function (){
        $(this).parent().append($(
            "<div class='m-1 p-1 border rounded-3 bg-light'>Added to cart!</div>"
        ))
        $(this).hide()
    })
})
