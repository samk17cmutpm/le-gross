(function(window, document, $, undefined){

  $(function() {

    var form_update_product = $("#form_update_product");

    var action_update_product = $("#action_update_product");

    $(action_update_product).click(function() {
      $(form_update_product).submit();
    })

  });

})(window, document, window.jQuery);
