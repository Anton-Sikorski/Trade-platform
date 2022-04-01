function destroyNode() {
    $('.destroyBtn').click(function(){
        const lineId = $(this).attr('id')
        $('#feature' + lineId).remove();
        $("#product_features_attributes_"+ lineId + "_id").remove()
    })
}

function addFeature() {
    $('#addFeature').click(function(){
        const nodeSize = $("#featuresList").children().length
        const childCount = Math.round((nodeSize / 2)) + nodeSize % 2
        $("#featuresList")
            .append($(
                "<div id='feature" + (childCount) + "'class='d-inline-flex'>" +
                "<input class='mr-1' type='text'  name='product[features_attributes][" + (childCount) + "][name]' id='product_features_attributes_" + (childCount) + "_name'>" +
                "<input class='mr-1' type='text' name='product[features_attributes][" + (childCount) + "][value]' id='product_features_attributes_" + (childCount) + "_value'>" +
                "<div id='" + (childCount) + "' class='destroyNode border rounded-3 bg-white p-1'>" +
                "<a class='m-2  text-dark'>X</a>" +
                "</div>" +
                "</div>"
            ));
        destroyNode()
    });
}

function addProductImagePreview() {
    $('.product-images input[type="file"]').on('change', () => {
        let srcArray = Array.from($('input[type="file"]').prop('files'))
        console.log(typeof srcArray)
        console.log(srcArray[0])

        srcArray.forEach((src) => {
            $('.product-images .image-container .slider').append($(
                '<img class="image-preview" src=' + URL.createObjectURL(src) + '>'
            ))
        })
    });
}

function addUserImagePreview() {
    $('.user-form input[type="file"]').on('change', () => {
        let newPicture = $('input[type="file"]').prop('files')[0]
        console.log(URL.createObjectURL(newPicture))
        console.log(newPicture)

        $('.user-form .avatar img').remove()
        $('.user-form .avatar').prepend($(
            '<img style="width: 100px; height: 100px" class="user-image" src=' + URL.createObjectURL(newPicture) + '>'
        ))
    });
}

$(document).ready(function(){
    destroyNode()
    addFeature()
    addProductImagePreview()
    addUserImagePreview()
});
