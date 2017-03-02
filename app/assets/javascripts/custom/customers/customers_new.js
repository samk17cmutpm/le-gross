(function(window, document, $, undefined){

  $(function() {

    var form_create_customer = $("#form_create_customer");

    var action_create_customer = $("#action_create_customer");

    $(action_create_customer).click(function() {
      $(form_create_customer).submit();
    })

  });

})(window, document, window.jQuery);
