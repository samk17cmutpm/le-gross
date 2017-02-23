(function(window, document, $, undefined){

  $(function() {

    // Main Data
    var customers_data = $.parseJSON(gon.customers);
    var products_data = $.parseJSON(gon.products);

    // This the first INITIALIZE FOR THE FORM
    var customer_list_element = $("#log_exported_products_customers");
    var products_list_element = $("#products_list");
    var inputs_element = $("#input_fields_wrap");

    $(customer_list_element).select2({
          placeholder: 'Select a state',
          allowClear: false,
          theme: 'bootstrap'
    });

    $(products_list_element).select2({
        placeholder: 'Select a state',
        allowClear: false,
        theme: 'bootstrap'
    });

    var add_new_product_element = $("#add_new_product");

    $(add_new_product_element).click(function(e){
      
      $(inputs_element).append('<tr><td class="order-item-content"><select id="products_list_' + temp + '" class="form-control wd-xl" name="product_id_'+ temp +'" ></select></td><td class="order-qty"><input type="number" name="quantity_'+ temp +'" value="1" min="1" class="form-control" /></td><td class="order-total"><button type="button" id="remove_' + temp + '" class="btn btn-sm btn-danger"><em class="fa fa-trash"></em></button></td></tr>');

    });

  });

})(window, document, window.jQuery);
