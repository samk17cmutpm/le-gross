(function(window, document, $, undefined){

  $(function() {

    // Main Data
    var customers_data = $.parseJSON(gon.customers);
    var products_data = $.parseJSON(gon.products);

    // This the first INITIALIZE FOR THE FORM
    var customer_list_element = $("#customer_list");
    var customer_phone_number_element = $("#customer_phone_number");
    var products_list_element = $("#products_list");
    var inputs_element = $(".input_fields_wrap");
    var add_new_product_element = $("#add_new_product");
    var submit = $("#submit");

    var inputs_order = 0;

    var params_of_signal = [0];

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


    $(customer_list_element).on('change', function () {
      var customer_phone_number = find_object_by_id_in_a_list(customers_data, this.value);
      $(customer_phone_number_element).text(customer_phone_number.phone_number)
    });


    $(add_new_product_element).click(function(e){

      ++inputs_order;

      params_of_signal.push(inputs_order);

      $(inputs_element).append('<tr><td class="order-item-content"><select id="products_list_' + inputs_order + '" class="form-control wd-xl" name="product_id_'+ inputs_order +'" ></select></td><td class="order-qty"><input type="number" name="quantity_of_the_product_'+ inputs_order +'" value="1" min="1" class="form-control" /></td><td class="order-total"><button type="button" id="remove_the_product_' + inputs_order + '" class="btn btn-sm btn-danger"><em class="fa fa-trash"></em></button></td></tr>');

      var select_option_element = $("#products_list_" + inputs_order);
      var remove_the_product_element = $("#remove_the_product_" + inputs_order);

      $.each(products_data, function(key, value) {
               $(select_option_element)
                   .append($('<option class="form-control"></option>')
                   .attr("value",value.id)
                   .text(value.name));
      });

      $(select_option_element).select2({
            placeholder: 'Select a state',
            allowClear: false,
            theme: 'bootstrap'
      });

      $(select_option_element).on('change', function() {

      });

    });

    // Click Submit Button, Fire The Action
    $(submit).click(function(e){
        $(submit).val(params_of_signal);
    });


    // Find An Object In A List
    function find_object_by_id_in_a_list(data, id) {
      var object;
      $.each(data, function(key, value) {
           if (value.id == id) {
             object = value;
           }
      });
      return object;
    }

  });

})(window, document, window.jQuery);
