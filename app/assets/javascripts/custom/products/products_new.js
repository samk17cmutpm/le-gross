(function(window, document, $, undefined){

  $(function() {

    var form_create_product = $("#form_create_product");

    var action_create_product = $("#action_create_product");

    $(action_create_product).click(function() {
      $(form_create_product).submit();
    })

  });

})(window, document, window.jQuery);
