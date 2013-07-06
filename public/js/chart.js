var graphData = JSON.parse('<%= @graph_data %>');
$(document).ready(function() {
  var chartTemplate = '<div id="chart-container" style="width:100%; height:400px;"></div>'
  $.each(graphData, function(k, data) {
    var $chartTemplate = $(chartTemplate);
    $chartTemplate.highcharts({
      chart: {
        type: 'column'
      },
      title: {
        text: data.title
      },
      xAxis: {
        categories: data.choices
      },
      yAxis: {
        title: {
          text: 'count'
        }
      },
      series: [{
        data: data.data
      }]

    })
    $('.container').append($chartTemplate);
  });
});
