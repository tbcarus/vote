const restaurantAjaxUrl = "ui/admin/restaurants/";
// https://stackoverflow.com/a/5064235/548473
const ctx = {
    ajaxUrl: restaurantAjaxUrl,
    updateTable: function () {
        $.ajax({
            type: "GET",
            url: restaurantAjaxUrl
        }).done(updateTableByData);
    }
}

function updateRow(restaurantId) {
    form.find(":input").val("");
    $.get(ctx.ajaxUrl + restaurantId, function (restaurant) {
        form.find("input[id=id]").val(restaurant.id);
        form.find("input[id=name]").val(restaurant.name);
        $('#editRow').modal();
    });
}

// $(document).ready(function () {
$(function () {
    makeEditable(
        $("#datatable").DataTable({
            "ajax": {
                "url": restaurantAjaxUrl,
                "dataSrc": ""
            },
            "paging": false,
            "info": true,
            "columns": [
                {
                    "data": "name"
                },
                {
                    "orderable": false,
                    "defaultContent": "",
                    "render": renderEditBtn
                },
                {
                    "orderable": false,
                    "defaultContent": "",
                    "render": renderDeleteBtn
                }
            ],
            "order": [
                [
                    0,
                    "asc"
                ]
            ]
        })
    );
});