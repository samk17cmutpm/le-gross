(function(window, document, $, undefined){

  $(function() {

    var order_items = $.parseJSON(gon.order_items);

    $.each(order_items, function(key, value) {
      $('#swal_pay_' + key).on('click', function(e){
        e.preventDefault();
        swal({
          title: 'Enter The Money The Customer Pay For You ?',
          input: 'number',
          inputValue: value.price * value.quantity,
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
          $.ajax({
            url: "pays/make_it_paid",
            type: "get", //send it through get method
            data: {
              id: value.id
            },
            success: function(response) {

              swal({
                type: 'success',
                html: 'You entered: ' + result
              }).then(function (result) {
                location.reload();
              });
            },
            error: function(xhr) {
              //Do Something to handle error
            }
          });
          console.log(result);
        });
      });
    });

  });

})(window, document, window.jQuery);
