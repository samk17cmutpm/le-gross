(function(window, document, $, undefined){

  $(function() {

    var form_create_fakes = $("#form_create_fakes");

    var action_create_fakes = $("#action_create_fakes");

    $(action_create_fakes).click(function() {
      $(form_create_fakes).submit();
    })

  });

})(window, document, window.jQuery);
