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
          inputValidator: function (data) {
            return new Promise(function (resolve, reject) {
              if (data > value.price * value.quantity) {
                reject('Paid Amount Cannot Bigger Than Total Price')
              } else {
                resolve()
              }
            })
          }
        }).then(function (result) {
          $.ajax({
            url: "pays/make_it_paid",
            type: "get", //send it through get method
            data: {
              id: value.id,
              paid_amount: result
            },
            success: function(response) {

              swal({
                type: 'success',
                html: 'Successfully'
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
