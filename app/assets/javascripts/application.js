// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var token_form = $("#form_token input[name=authenticity_token]").val();
$(document).on('change','select#cost_by_resource_resource_id',function(){
    var url = '/activity_by_products/ajax_subresource?resource_id=' + $(this).val();
    $("#cost_by_resource_subresource_id option").remove();
    $('#cost_by_resource_subresource_id').removeAttr("disabled")
    $.get(url, function(data) {
        function SelectData (inf){
            $('#cost_by_resource_subresource_id')
                .append($("<option></option>")
                    .attr("value","")
                    .text("Seleccione Un Elemento"));
            for(i =0;i < inf.length;i++){
                $('#cost_by_resource_subresource_id')
                    .append($("<option></option>")
                        .attr("value",inf[i]['id'])
                        .text(inf[i]['name']));
            }
        }
        SelectData(data);
    });
});
$(document).on('change','select#indirect_activity_by_resource_resource_id',function(){
    var url = '/activity_by_products/ajax_subresource?resource_id=' + $(this).val();
    $("#indirect_activity_by_resource_subresource_id option").remove();
    $('#indirect_activity_by_resource_subresource_id').removeAttr("disabled")
    $.get(url, function(data) {
        function SelectData (inf){
            $('#indirect_activity_by_resource_subresource_id')
                .append($("<option></option>")
                    .attr("value","")
                    .text("Seleccione Un Elemento"));
            for(i =0;i < inf.length;i++){
                $('#indirect_activity_by_resource_subresource_id')
                    .append($("<option></option>")
                        .attr("value",inf[i]['id'])
                        .text(inf[i]['name']));
            }
        }
        SelectData(data);
    });
});
$(document).on('change','select#activity_by_product_id',function(){
    var url = '/activity_by_products/ajax_activity?subprocedure_id=' + $(this).val();
    $(".select_activity_by_product option").remove();
    $('.select_activity_by_product').removeAttr("disabled")
    $.get(url, function(data) {
        function SelectData (inf){
            $('.select_activity_by_product')
                .append($("<option></option>")
                    .attr("value","")
                    .text("Seleccione Una Actividad"));
            for(i =0;i < inf.length;i++){
                $('.select_activity_by_product')
                    .append($("<option></option>")
                        .attr("value",inf[i]['id'])
                        .text(inf[i]['name']));
            }
        }
        SelectData(data);

        //$('#cost_by_resource_subresource_id').append(new Option(data, false));
    });
});


var selects = [1];
var selects2 = [1];
var x = 2;
var new_selects = [];

function AddButton (val,num){
    var content_options= $('#product_value_'+selects[0]).html();
    $('#group_add').prepend('<div id="row_product'+x+'" class="row"><div class="col-md-6"><select class="form-control" name="production_order[product_id]" id="product_value_'+x+'" required="required" >'+content_options+'</select><br></div><div class="col-md-5"><input id="product_quantity_'+x+'" class="form-control" step="any" placeholder="Ingrese su cantidad" required="required" type="number" name="production_order[quantity]" id="production_order_quantity"><br></div><div class="col-md-1"><div id="button_add'+x+'" class="btn btn-primary button_add" onclick="AddButton(this.id,'+x+')"><i class="glyphicon glyphicon-plus"></i></a></div></div>')
    $('#'+val).removeAttr('onclick');
    $('#'+val).attr('onclick','RemoveSelects('+num+')');
    $('#'+val).html('<i class="glyphicon glyphicon-remove"></i>');
    $('#'+val).removeClass('button_add');
    $('#'+val).addClass('button_remove');

    console.log('.button_add'+(x-1));
    selects.push(x);
    x = x+1
};
function chargeActivity(id,value) {
    var url = '/activity_by_products/ajax_indirect_activity?subprocedure_id=' + value;
    $(".select_ind_act_"+id+" option").remove();
    $(".select_ind_act_"+id).removeAttr("disabled")
    $.get(url, function(data) {
        function SelectData (inf){
            $(".select_ind_act_"+id)
                .append($("<option></option>")
                    .attr("value","")
                    .text("Seleccione Una Actividad"));
            for(i =0;i < inf.length;i++){
                $(".select_ind_act_"+id)
                    .append($("<option></option>")
                        .attr("value",inf[i]['id'])
                        .text(inf[i]['name']));
            }
        }
        SelectData(data);

        //$('#cost_by_resource_subresource_id').append(new Option(data, false));
    });
}
function chargeProduct(id,value) {
    var url = '/activity_by_products/ajax_product?macroproduct_id=' + value;
    $(".select_product_"+id+" option").remove();
    $(".select_product_"+id).removeAttr("disabled")
    $.get(url, function(data) {
        function SelectData (inf){
            $(".select_product_"+id)
                .append($("<option></option>")
                    .attr("value","")
                    .text("Seleccione Un Producto"));
            for(i =0;i < inf.length;i++){
                $(".select_product_"+id)
                    .append($("<option></option>")
                        .attr("value",inf[i]['id'])
                        .text(inf[i]['name']));
            }
        }
        SelectData(data);

        //$('#cost_by_resource_subresource_id').append(new Option(data, false));
    });
}
var y=2;
function AddButtonIndirectActivity (val,num){
    var content_options= $('#indirect_activity_by_product_id').html();
    $('#group_add_1').prepend('<div class="row row_activity_'+x+'">' +
                                '<div class="col-xs-5">' +
                                    '<select class="form-control select_activity_by_product_id" name="indirect_activity_by_product[id]" id="indirect_activity_by_product_id" onChange="chargeActivity('+x+',this.value)">'+content_options+'</select>' +
                                '</div>' +
                                '<div class="col-xs-7">' +
                                    '<select disabled="disabled" class="form-control select_activity_by_product select_ind_act_'+x+'" name="indirect_activity_by_product[indirect_activity_id]" id="indirect_activity_by_product_indirect_activity_id">' +
                                        '<option value="">Seleccione una Actividad</option>' +
                                    '</select>' +
        '                       </div>' +
                            '</div>');
    $('#th_group').prepend('<div id="button_activity_remove_1" class="btn btn-primary button_remove">' +
                                '<i class="glyphicon glyphicon-remove"></i>' +
                            '</div>');
    $('#button_activity_remove_1').attr('onclick','RemoveSelectsIndirectActivity('+x+')');

    console.log('.button_add'+(x-1));
    selects.push(x);
    x = x+1
};
function AddButtonIndirectActivityByProduct (val,num){
    var content_options= $('.select_product_id').html();
    $('#group_add_2').prepend('<div class="row row_product_'+y+'"><div class="col-xs-5"><select class="form-control select_activity_by_product_id" name="indirect_activity_by_product[id]" id="indirect_activity_by_product_id" onChange="chargeProduct('+y+',this.value)">'+content_options+'</select></div><div class="col-xs-6"> <select disabled="disabled" class="form-control select_activity_by_product select_product_'+y+'" name="indirect_activity_by_product[indirect_activity_id]" id="indirect_activity_by_product_indirect_activity_id"><option value="">Seleccione una Actividad</option></select> </div> <div class="col-xs-1"> <div id="button_product_add_1" class="btn btn-primary button_indirect_activity_add" onclick="AddButtonIndirectActivityByProduct(this.id,1)"> <i class="glyphicon glyphicon-plus"></i></div></div></div>');
    $('#'+val).removeAttr('onclick');
    $('#'+val).attr('onclick','RemoveSelectsProduct('+y+')');
    $('#'+val).html('<i class="glyphicon glyphicon-remove"></i>');
    $('#'+val).removeClass('button_add');
    $('#'+val).addClass('button_remove');

    console.log('.button_add'+(y-1));
    selects2.push(y);
    y = y+1
};
function AddButtonIndirect (val,num){
    var content_options= $('#product_value_'+selects[0]).html();
    $('#group_add').prepend('<div id="row_product'+x+'" class="row"><div class="col-md-11"><select class="form-control" id="product_value_'+x+'" required="required" name="indirect_activity_by_product[product]">'+$('select#product_value_1').html()+'</select></div><div class="col-md-1"><div id="button_add'+x+'" class="btn btn-primary button_add" onclick="AddButtonIndirect(this.id,'+x+')"><i class="glyphicon glyphicon-plus"></i></div></div>')
    $('#'+val).removeAttr('onclick');
    $('#'+val).attr('onclick','RemoveSelects('+num+')');
    $('#'+val).html('<i class="glyphicon glyphicon-remove"></i>');
    $('#'+val).removeClass('button_add');
    $('#'+val).addClass('button_remove');

    console.log('.button_add'+(x-1));
    selects.push(x);
    x = x+1
};
function RemoveSelectsIndirect (val) {
    $('#row_product'+val).remove();
    console.log('.product'+val);
    new_selects = [];
    for (var i=0; i < selects.length;i++) {
        if (selects[i]!=val){
            new_selects.push(selects[i]);
        }
    }
    selects = new_selects;
    console.log('elimino');
}
function RemoveSelects (val) {
    $('#row_product'+val).remove();
    console.log('.product'+val);
    new_selects = [];
    for (var i=0; i < selects.length;i++) {
      if (selects[i]!=val){
           new_selects.push(selects[i]);
        }
    }
    selects = new_selects;
    console.log('elimino');
}
function RemoveSelectsIndirectActivity (val) {
    $('.row_activity_'+val).remove();
    $('#'+val).remove();
    console.log('.product'+val);
    new_selects = [];
    for (var i=0; i < selects.length;i++) {
        if (selects[i]!=val){
            new_selects.push(selects[i]);
        }
    }
    selects = new_selects;
    console.log('elimino');
}
function RemoveSelectsProduct (val) {
    $('.row_product_'+val).remove();
    console.log('.product'+val);
    new_selects = [];
    for (var i=0; i < selects.length;i++) {
        if (selects2[i]!=val){
            new_selects.push(selects[i]);
        }
    }
    selects2 = new_selects;
    console.log('elimino');
}
$('form#new_production_order').submit(function(e){
    var product_id = [];
    for (var i = 0; i < selects.length;i++){
        var select_value = $('#product_value_'+selects[i]).val();
        var quantity = $('#product_quantity_'+selects[i]).val();
        product_id.push( {product_id : select_value,quantity : quantity});
        //product_id.push(select_value);
        //product_id.push(quantity);
    }
    for (var i = 0; i < product_id.length;i++){
        for (var x = i+1; x < product_id.length;x++){
            if (product_id[i]['product_id'] == product_id[x]['product_id']){
                alert('No se debe repetir el producto');
                return false;
            }
        }
    }
    console.log(product_id);
    product_id = JSON.stringify(product_id);
    $('.product_id_object').val(product_id);
    return true;
});
function PreSubmitIndirect() {
    var indirect_activity_id = [];
    for (var i = 0; i < selects.length;i++){
        var select_value = $('.select_ind_act_'+selects[i]+'').val();
        indirect_activity_id.push( {indirect_activity_id: select_value});
    }
    for (var i = 0; i < indirect_activity_id.length;i++){
        for (var x = i+1; x < indirect_activity_id.length;x++){
            if (indirect_activity_id[i]['indirect_activity_id'] == indirect_activity_id[x]['indirect_activity_id']){
                alert('No se debe repetir la actividad');
                return false;
            }
        }
    }
    var product_id = [];
    for (var i = 0; i < selects2.length;i++){
        var select_value = $('.select_product_'+selects2[i]).val();
        product_id.push( {product_id : select_value});
        //product_id.push(select_value);
        //product_id.push(quantity);
    }
    for (var i = 0; i < product_id.length;i++){
        for (var x = i+1; x < product_id.length;x++){
            if (product_id[i]['product_id'] == product_id[x]['product_id']){
                alert('No se debe repetir el producto');
                return false;
            }
        }
    }

    console.log(indirect_activity_id);
    console.log(product_id);
    product_id = JSON.stringify(product_id);
    indirect_activity_id = JSON.stringify(indirect_activity_id);
    $('.product_id_object').val(product_id);
    $('.indirect_activity_id_object').val(indirect_activity_id);
    return true;
}
function PreSubmit() {
    var product_id = [];
    for (var i = 0; i < selects.length;i++){
        var select_value = $('#product_value_'+selects[i]).val();
        var quantity = $('#product_quantity_'+selects[i]).val();
        product_id.push( {product_id : select_value,quantity : quantity});
        //product_id.push(select_value);
        //product_id.push(quantity);
    }
    for (var i = 0; i < product_id.length;i++){
        for (var x = i+1; x < product_id.length;x++){
            if (product_id[i]['product_id'] == product_id[x]['product_id']){
                alert('No se debe repetir el producto');
                return false;
            }
        }
    }
    console.log(product_id);
    product_id = JSON.stringify(product_id);
    $('.product_id_object').val(product_id);
    return true;
}
function ActivosPreSubmit() {
    var day_for_month = $('#day_for_month').val();
    var hour_for_day = $('#hours_for_day').val();
    var hour_for_month = day_for_month * hour_for_day;
    $('#subresource_hours_worked').val(hour_for_month);
    var year = $('#year').val();
    var month = $('#month').val();
    var year_total = year * 12 * hour_for_month;
    var month_total = month * hour_for_month;
    var hours_total = year_total + month_total;
    var cost = $('#subresource_market_valuer').val();
    $('#subresource_useful_life').val(hours_total);
    $('#subresource_unit_cost').val(cost/hours_total);
    console.log(hour_for_month);
    console.log(day_for_month);
    console.log(hour_for_day);
}
$(document).ready(function(){
    /*$("div #sub_menu").hide();
    var click_menu = 0;
    $("#button_menu").click(function(){
        if (click_menu == 0) {
            $('#button_menu').prop('onclick','OpenMenu()');
            $("div #sub_menu").fadeIn();
            click_menu = 1;
            console.log('si');
        }else if (click_menu == 1) {
            $('#button_menu').prop('onclick','OpenMenu()');
            $("div #sub_menu").fadeOut();
            click_menu = 0;
            console.log('no');
        }

    });*/
});


$("#button_menu").click(function(){


});
var click_menu;
function OpenCloseMenu(){
    if($('div #sub_menu:visible').length == 0)
    {
        click_menu = 0;
    }else{
        click_menu = 1;
    }
    if (click_menu == 0) {
        $("div #sub_menu").fadeIn();
        click_menu = 1;
    }else if (click_menu == 1) {
        $("div #sub_menu").fadeOut();
        click_menu = 0;
    }
}


function SearchSubresource1 (resource,palabra) {
    var url = "/subresources/search?resource_id="+resource+"&name="+palabra
    console.log(url);
    $(".table-search tr").remove();
    $('.loading').show();
    $.get(url, function(data) {
        function SelectData (inf){
            console.log(inf)
            setTimeout(function(){
                $('.loading').hide();
                for(i =0;i < inf.length;i++){
                    var unitCost=(10).toFixed(1).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')
                    $('.table-search')
                        .append("<tr>" +
                                    "<td>"+inf[i]['reference']+"</td>" +
                                    "<td>"+inf[i]['name']+"</td>" +
                                    "<td>"+inf[i]['meter_name']+"</td>" +
                                    "<td>"+inf[i]['provider_name']+"</td>" +
                                    "<td>"+inf[i]['unit_cost']+"</td>" +
                                    "<td>"+inf[i]['stock_maximum']+"</td>" +
                                    "<td>"+inf[i]['stock_minimum']+"</td>" +
                                    "<td>"+inf[i]['current_stock']+"</td>" +
                                    "<td>" +
                                        "<a data-remote='true' href='/resources/1/subresources/"+inf[i]['current_stock']+"/edit'><i class='glyphicon glyphicon-pencil'></i></a>" +
                                        "<a data-confirm='Esta seguro?' rel='nofollow' data-method='delete' href='/resources/1/subresources/"+inf[i]['id']+"'><i class='glyphicon glyphicon-remove'></i></a>" +
                                    "</td>"+
                                "</tr>");
                    console.log(inf[i]);
                }
            }, 500);

        }
        SelectData(data);
    });
}

function SearchSubresource2 (resource,palabra) {
    var url = "/subresources/search?resource_id="+resource+"&name="+palabra
    console.log(url);
    $(".table-search tr").remove();
    $('.loading').show();
    $.get(url, function(data) {
        function SelectData (inf){
            console.log(inf)
            setTimeout(function(){
                $('.loading').hide();

                for(i =0;i < inf.length;i++){
                    $('.table-search')
                        .append("<tr>" +"<td>"+inf[i]['identity_card']+"</td>"+"<td>"+inf[i]['name']+"</td>"+"<td>"+inf[i]['salary']+"</td>"+"<td>"+inf[i]['hours_worked']+"</td>"+"<td>"+inf[i]['value_hour']+"</td>"+"<td><a data-remote='true' href='/resources/2/subresources/"+inf[i]['current_stock']+"/edit'><i class='glyphicon glyphicon-pencil'></i></a><a data-confirm='Esta seguro?' rel='nofollow' data-method='delete' href='/resources/2/subresources/"+inf[i]['id']+"'><i class='glyphicon glyphicon-remove'></i></a></td>"+
                            "</tr>");
                    console.log(inf[i]);
                }
            }, 500);

        }
        SelectData(data);
    });
}

function SearchSubresource3 (resource,palabra) {
    var url = "/subresources/search?resource_id="+resource+"&name="+palabra
    console.log(url);
    $(".table-search tr").remove();
    $('.loading').show();
    $.get(url, function(data) {
        function SelectData (inf){
            console.log(inf)
            setTimeout(function(){
                $('.loading').hide();

                for(i =0;i < inf.length;i++){
                    $('.table-search')
                        .append("<tr>" +"<td>"+inf[i]['name']+"</td>"+"<td>"+inf[i]['meter_id']+"</td>"+"<td>"+inf[i]['provider_id']+"</td>"+"<td>"+inf[i]['unit_cost']+"</td>"+"<td>"+inf[i]['stock_maximum']+"</td>"+"<td>"+inf[i]['stock_minimum']+"</td>"+"<td>"+inf[i]['current_stock']+"</td>"+"<td><a data-remote='true' href='/resources/1/subresources/"+inf[i]['current_stock']+"/edit'><i class='glyphicon glyphicon-pencil'></i></a><a data-confirm='Esta seguro?' rel='nofollow' data-method='delete' href='/resources/1/subresources/"+inf[i]['id']+"'><i class='glyphicon glyphicon-remove'></i></a></td>"+
                            "</tr>");
                    console.log(inf[i]);
                }
            }, 500);

        }
        SelectData(data);
    });
}

function SearchSubresource4 (resource,palabra) {
    var url = "/subresources/search?resource_id="+resource+"&name="+palabra
    console.log(url);
    $(".table-search tr").remove();
    $('.loading').show();
    $.get(url, function(data) {
        function SelectData (inf){
            console.log(inf)
            setTimeout(function(){
                $('.loading').hide();

                for(i =0;i < inf.length;i++){
                    $('.table-search')
                        .append(
                            "<tr>" +
                                "<td>"+inf[i]['name']+"</td>"+
                                "<td>"+inf[i]['meter_id']+"</td>"+
                                "<td>"+inf[i]['provider_id']+"</td>"+
                                "<td>"+inf[i]['unit_cost']+"</td>"+"" +
                                "<td>"+inf[i]['stock_maximum']+"</td>"+
                                "<td>"+inf[i]['stock_minimum']+"</td>"+
                                "<td>"+inf[i]['current_stock']+"</td>"+
                                "<td>" +
                                    "<a data-remote='true' href='/resources/1/subresources/"+inf[i]['current_stock']+"/edit'>" +"<i class='glyphicon glyphicon-pencil'></i></a>" +
                                    "<a data-confirm='Esta seguro?' rel='nofollow' data-method='delete' " +"href='/resources/1/subresources/"+inf[i]['id']+"'><i class='glyphicon glyphicon-remove'></i></a><" +
                                "/td>" +
                            "</tr>");
                    console.log(inf[i]);
                }
            }, 500);

        }
        SelectData(data);
    });
}

function SearchProducts (palabra) {
    var url = "/products/search?name="+palabra
    console.log(url);
    $(".table-searchP tr").remove();
    $('.loading').show();
    $.get(url, function(data) {
        function SelectData (inf){
            console.log(inf)
            setTimeout(function(){
                $('.loading').hide();

                for(i =0;i < inf.length;i++){
                    $('.table-searchP')
                        .append(
                            "<tr>" +
                                "<td>" + inf[i]['macroproduct_name'] + "</td>" +
                                "<td>" + inf[i]['name'] + "</td>" +
                                "<td><a href='/graphic_reports/"+inf[i]['id']+"'>" +"<i class='glyphicon glyphicon-new-window'></i></a></td>" +
                            "</tr>");
                    console.log(inf[i]);
                }
            }, 500);

        }
        SelectData(data);
    });
}
$( document ).ready(function() {
    //$( "select" ).select2({
       // theme: "bootstrap"
    //});
});
