// CHART SPLINE
// -----------------------------------
(function(window, document, $, undefined){

  $(function(){

    var log_revenues;
    var data_log_revenues = [];

    log_revenues = $.parseJSON(gon.log_revenues);

    console.log(log_revenues);


    $.each(log_revenues, function(index, item){
        data_log_revenues.push([item.date_exported, item.revenue]);
    });

    var datav3 = [{
      "label": "Lợi nhuận",
      "color": "#1ba3cd",
      "data": data_log_revenues
    }];

    var options = {
      series: {
          lines: {
              show: false
          },
          points: {
              show: true,
              radius: 4
          },
          splines: {
              show: true,
              tension: 0.4,
              lineWidth: 1,
              fill: 0.5
          }
      },
      grid: {
          borderColor: '#eee',
          borderWidth: 1,
          hoverable: true,
          backgroundColor: '#fcfcfc'
      },
      tooltip: true,
      tooltipOpts: {
          content: function (label, x, y) { return 'Ngày lập ' + x + ' : Tổng giá trị lợi nhuận ' + y ; }
      },
      xaxis: {
          tickColor: '#fcfcfc',
          mode: 'categories'
      },
      yaxis: {
          tickColor: '#eee',
          //position: 'right' or 'left',
          tickFormatter: function (v) {
              return v/* + ' visitors'*/;
          }
      },
      shadowSize: 0
    };


    var chartv3 = $('.chart-splinev3');
    if(chartv3.length)
      $.plot(chartv3, datav3, options);

  });

})(window, document, window.jQuery);
