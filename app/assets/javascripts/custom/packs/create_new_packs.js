(function(window, document, $, undefined){

  $(function() {

    var repositories_data = $.parseJSON(gon.repositories);
    var products_data = $.parseJSON(gon.products);

    var products_list_element = $("#products_list_0");
    var remove_the_product_element = $("#remove_the_product_0");
    var inputs_element = $(".input_fields_wrap");
    var add_new_product_element = $("#add_new_product");
    var quantity_of_the_product_element = $('input[name=quantity_of_the_product_0]')
    var submit = $("#submit");

    var inputs_order = 0;
    var total_inputs =  1;
    var params_of_signal = [0];

    var temp_product = products_data[0];
    var temp_repository = repositories_data[0];


    var status_list = $("#status_list");
    $(status_list).select2({
          placeholder: 'Select a state',
          allowClear: false,
          theme: 'bootstrap'
    });

    $(products_list_element).select2({
          placeholder: 'Select a state',
          allowClear: false,
          theme: 'bootstrap'
    });

    $(products_list_element).on('change', function() {
      temp_repository = find_object_by_id_in_a_list(repositories_data, this.value);
      update_max_for_input(quantity_of_the_product_element, temp_repository.number);
      if($(quantity_of_the_product_element).val() > temp_repository.number)
        $(quantity_of_the_product_element).val(temp_repository.number)
    });

    $(quantity_of_the_product_element).on('change', function() {
      if($(quantity_of_the_product_element).val() > temp_repository.number)
        $(quantity_of_the_product_element).val(temp_repository.number);

      if($(quantity_of_the_product_element).val() < 1)
        $(quantity_of_the_product_element).val(1);

    });

    $(remove_the_product_element).click(function() {
      if (total_inputs > 1) {
        $(this).parent('td').parent('tr').remove();
        --total_inputs;
        var index = params_of_signal.indexOf(0);
        params_of_signal.splice(index, 1);
      }
    });



    $(add_new_product_element).click(function(e){

      ++inputs_order;
      ++total_inputs;

      var temp_repository_local = repositories_data[0];

      params_of_signal.push(inputs_order);

      $(inputs_element).append('<tr><td class="order-item-content"><select id="products_list_' + inputs_order + '" class="form-control wd-xl" name="product_id_'+ inputs_order +'" ></select></td><td class="order-qty"><input type="number" name="quantity_of_the_product_'+ inputs_order +'" value="1" min="1" max="'+ repositories_data[0].number +'" class="form-control" /></td><td class="order-total"><button type="button" id="remove_the_product_' + inputs_order + '" class="btn btn-sm btn-danger"><em class="fa fa-trash"></em></button></td></tr>');

      var select_option_element = $("#products_list_" + inputs_order);
      var remove_the_product_element = $("#remove_the_product_" + inputs_order);
      var quantity_of_the_product_element = $("input[name=quantity_of_the_product_"+inputs_order+"]");

      $.each(repositories_data, function(key, value) {

               var product_name = find_object_by_id_in_a_list(products_data, value.product_id).name;

               $(select_option_element)
                   .append($('<option class="form-control"></option>')
                   .attr("value",value.product_id)
                   .text(product_name));

      });

      $(select_option_element).select2({
            placeholder: 'Select a state',
            allowClear: false,
            theme: 'bootstrap'
      });

      $(select_option_element).on('change', function() {
        temp_repository_local = find_object_by_id_in_a_list(repositories_data, this.value);
        update_max_for_input(quantity_of_the_product_element, temp_repository_local.number);
        if($(quantity_of_the_product_element).val() > temp_repository_local.number)
          $(quantity_of_the_product_element).val(temp_repository_local.number)
      });

      $(quantity_of_the_product_element).on('change', function() {
        if($(quantity_of_the_product_element).val() > temp_repository_local.number)
          $(quantity_of_the_product_element).val(temp_repository_local.number);

        if($(quantity_of_the_product_element).val() < 1)
          $(quantity_of_the_product_element).val(1);

      });

      $(remove_the_product_element).click(function() {
        if (total_inputs > 1) {
          $(this).parent('td').parent('tr').remove();
          --total_inputs;
          var index = params_of_signal.indexOf(inputs_order);
          params_of_signal.splice(index, 1);
        }
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
    };

    function update_max_for_input(input_tag, value) {
      $(input_tag).attr({
       "max" : value      // substitute your own
      });
    };


  });

})(window, document, window.jQuery);
