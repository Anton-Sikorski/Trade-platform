$(document).ready(function() {
    $('a[data-target]').click(function(e){
        e.preventDefault()
        let $this = $(this)
        if ( $this.data('target') === 'Add to') {
            let url = $this.data('addurl')
            let new_target = "Remove from"
        } else {
            let url = $this.data('removeurl');
            let new_target = "Add to";
            $.ajax({
                url: url, type: 'put', success: (data) => {
                    $('.cart-count').html(data);
                    $this.find('span').html(new_target);
                    $this.data('target', new_target)
                }
            })
        }
    })
})

$(document).ready(function() {
    $('#mycart').click(function (e) {
        e.preventDefault()
        let $this = $(this).closest('a')
        let url = $this.data('targeturl')
        $.ajax({
            url: url, type: 'put', success: (data) => {
                $('.cart-count').html(data);
                $this.closest('.cart-movie').slideUp()
            }
        })
    })
})
