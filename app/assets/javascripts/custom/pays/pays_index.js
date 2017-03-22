(function(window, document, $, undefined){

  $(function() {

    var order_items = $.parseJSON(gon.order_items);

    $.each(order_items, function(key, value) {
      $('#swal_pay_' + key).on('click', function(e){
        e.preventDefault();
        swal({
          title: 'Enter The Money The Customer Pay For You ?',
          input: 'number',
          showCancelButton: true,
          inputValidator: function (value) {
            return new Promise(function (resolve, reject) {
              if (value) {
                resolve()
              } else {
                reject('You need to write something!')
              }
            })
          }
        }).then(function (result) {
          swal({
            type: 'success',
            html: 'You entered: ' + result
          })
        });
      });
    });

  });

})(window, document, window.jQuery);
