function destroyNode() {
    $('.destroyBtn').click(function(){
        const lineId = $(this).attr('id')
        $('#feature' + lineId).remove();
        $("#product_features_attributes_"+ lineId + "_id").remove()
    })
}

$(document).ready(function(){
    destroyNode()

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
});
