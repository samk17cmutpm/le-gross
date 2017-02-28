(function(window, document, $, undefined){

  $(function() {

    var select_products = $("#products_list");
    
    $(select_products).select2({
          placeholder: 'Select a state',
          allowClear: false,
          theme: 'bootstrap'
    });

  });

})(window, document, window.jQuery);
