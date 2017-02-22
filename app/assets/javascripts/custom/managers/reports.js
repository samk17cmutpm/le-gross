// CHART SPLINE
// -----------------------------------
(function(window, document, $, undefined){

  $(function(){

    var imported_reports, exported_reports;
    var data_imported_reports = [];
    var data_exported_reports = [];

    imported_reports = $.parseJSON(gon.imported_reports);
    exported_reports = $.parseJSON(gon.exported_reports);

    console.log(imported_reports);

    $.each(imported_reports, function(index, item){
        data_imported_reports.push([item.time, item.total]);
    });

    $.each(exported_reports, function(index, item){
        data_exported_reports.push([item.time, item.total]);
    });


    var datav3 = [{
      "label": "Nhập hàng hóa",
      "color": "#1ba3cd",
      "data": data_imported_reports
    }];

    var datav4 = [{
      "label": "Xuất hàng hóa",
      "color": "#1ba3cd",
      "data": data_exported_reports
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
          content: function (label, x, y) { return 'Ngày lập ' + x + ' : Tổng giá trị đơn hàng ' + y ; }
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
    var chartv4 = $('.chart-splinev4');
    if(chartv3.length)
      $.plot(chartv3, datav3, options);

    if(chartv4.length)
      $.plot(chartv4, datav4, options);

  });

})(window, document, window.jQuery);
