(function(window, document, $, undefined){

  $(function() {

    var form_edit_customer = $("#form_edit_customer");

    var action_update_customer = $("#action_update_customer");

    $(action_update_customer).click(function() {
      $(form_edit_customer).submit();
    })

  });

})(window, document, window.jQuery);
