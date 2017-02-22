// Custom jQuery
// -----------------------------------


(function(window, document, $, undefined){

  $(function(){

    var wrapper, add_button, total_price, submit;
    var x, data, clients, count, columns;

    // if (typeof(gon) != "undefined") {

      wrapper         = $(".input_fields_wrap"); //Fields wrapper
      add_button      = $(".add_field_button"); //Add button ID
      total_price     = $("#total_price");
      submit          = $("#submit");

      x = 0; //initlal text box count
      data = $.parseJSON(gon.products);
      clients = $.parseJSON(gon.clients);
      count = 1;
      columns = [0];
      $(add_button).click(function(e){ //on add input button click
          // console.log(gon.clients);
          e.preventDefault();
          var temp = ++x; //text box increment
          count++;
          columns.push(temp);
          $(wrapper).append('<tr><td class="order-item-content"><select id="log_exported_products-4-' + temp + '" class="form-control wd-xl" name="product_id_'+ temp +'" ></select></td><td class="order-qty"><input type="number" name="quantity_'+ temp +'" value="1" min="1" max="'+ data[0].quantity +'" class="form-control" /></td><td id="product_price_'+ temp +'" class="order-price">'+ data[0].price +'</td><td id="product_quantity_'+ temp +'" class="order-price">'+ data[0].quantity +'</td><td id="unit_'+ temp +'" class="order-tax">'+ data[0].unit +'</td> <td id="total_price_'+ temp +'" class="order-total">'+ data[0].price +'</td><td class="order-total"><button type="button" id="remove_' + temp + '" class="btn btn-sm btn-danger"><em class="fa fa-trash"></em></button></td></tr>');

          var tag_select    = $('#log_exported_products-4-' + temp);
          var tag_remove    = $('#remove_' + temp);
          var price_tag     = $('#product_price_' + temp);
          var unit_tag      = $('#unit_' + temp);
          var quantity_tag  = $('input[name=quantity_'+ temp +']');
          var total_price_tag   = $('#total_price_' + temp);
          var product_quantity_tag   = $('#product_quantity_' + temp);
          var product       = data[0];


          $.each(data, function(key, value) {
               $(tag_select)
                   .append($('<option class="form-control"></option>')
                   .attr("value",value.id)
                   .text(value.name));
          });

          update_total_price(count_total_price(columns), $(total_price));

          $(tag_select).select2({
              placeholder: 'Select a state',
              allowClear: false,
              theme: 'bootstrap'
          });

          $(tag_remove).click(function(){
            if (count > 1) {
              e.preventDefault();
              $(this).parent('td').parent('tr').remove();
              count--;
              var index = columns.indexOf(temp);
              columns.splice(index, 1);
              update_total_price(count_total_price(columns), $(total_price));
            }
          });

          $(tag_select).on('change', function() {
            product       = find_object_by_id(data, this.value);
            update_row(product, price_tag, unit_tag, total_price_tag, quantity_tag, product_quantity_tag);
            update_total_price(count_total_price(columns), $(total_price));
            update_max_for_input(quantity_tag, product.quantity);

            var current_value = $(quantity_tag).val();
            if (current_value > product.quantity) {
              $(quantity_tag).val(product.quantity);
              $(total_price_tag).text(product.price * $(quantity_tag).val());
              update_total_price(count_total_price(columns), $(total_price));
            }

          });

          $(quantity_tag).on('change', function() {
            if($(quantity_tag).val() > product.quantity) {
              $(quantity_tag).val(product.quantity);
            }

            if($(quantity_tag).val() < 1)
              $(quantity_tag).val(1);

            $(total_price_tag).text(product.price * $(quantity_tag).val());
            update_total_price(count_total_price(columns), $(total_price));
          });
      });

      $('#remove_0').click(function(e){
        if (count > 1) {
          e.preventDefault(); $(this).parent('td').parent('tr').remove();
          count--;
          var index = columns.indexOf(0);
          columns.splice(index, 1);
          update_total_price(count_total_price(columns), $(total_price));
        }
      });

      $(submit).click(function(e){
        $(submit).val(columns);
      });

      var product = data[0];

      $('#log_exported_products-4-0').on('change', function() {
        product           = find_object_by_id(data, this.value);
        var price_tag     = $("#product_price_0");
        var unit_tag      = $("#unit_0");
        var quantity_tag  = $('input[name=quantity_0]');
        var total_price_tag   = $('#total_price_0');
        var product_quantity_tag = $('#product_quantity_0');
        update_row(product, price_tag, unit_tag, total_price_tag, quantity_tag, product_quantity_tag);
        update_total_price(count_total_price(columns), $(total_price));
        update_max_for_input(quantity_tag, product.quantity);

        var current_value = $(quantity_tag).val();
        if (current_value > product.quantity) {
          $(quantity_tag).val(product.quantity);
          $(total_price_tag).text(product.price * $(quantity_tag).val());
          update_total_price(count_total_price(columns), $(total_price));
        }
      });

      $('input[name=quantity_0]').on('change', function() {
        if($('input[name=quantity_0]').val() > product.quantity)
          $('input[name=quantity_0]').val(product.quantity);

        if($('input[name=quantity_0]').val() < 1)
          $('input[name=quantity_0]').val(1);

        $('#total_price_0').text(product.price * $('input[name=quantity_0]').val());
        update_total_price(count_total_price(columns), $(total_price));
      });

      $('#log_exported_products_clients').on('change', function() {
        var client = find_object_by_id(clients, this.value);
        $('#client_code').text(client.code);
        $('#client_address').text(client.address);
      });

      $('#log_exported_products_clients').select2({
          placeholder: 'Select a state',
          allowClear: false,
          theme: 'bootstrap'
      });



    // }

    function find_object_by_id(data, id) {
      var object;
      $.each(data, function(key, value) {
           if (value.id == id) {
             object = value;
           }
      });
      return object;
    }

    function update_row(product, price_tag, unit_tag, total_price_tag, quantity_tag, product_quantity_tag) {
      $(price_tag).text(product.price);
      $(unit_tag).text(product.unit);
      $(total_price_tag).text(product.price * $(quantity_tag).val());
      $(product_quantity_tag).text(product.quantity);
    }

    function count_total_price(columns) {
      var total = 0;
      $.each(columns, function(key, value) {
          var content = $('#total_price_' + value).text();
          total = total + Number(content);
      });
      return total;
    }

    function update_total_price(total, total_price) {
      $(total_price).text(total);
    }

    function update_max_for_input(input_tag, value) {
      $(input_tag).attr({
       "max" : value      // substitute your own
      });
    }


  });

})(window, document, window.jQuery);
