import Chart from 'chart.js/auto';

const donutChart = () => {

  const chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
  };

  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: JSON.parse(ctx.canvas.dataset.labels),
      datasets: [{
        data: JSON.parse(ctx.canvas.dataset.data),
        backgroundColor: [
          chartColors.red,
          chartColors.orange,
          chartColors.yellow,
          chartColors.green,
          chartColors.blue,
        ],
        // borderColor: [
        //   chartColors.red,
        //   chartColors.orange,
        //   chartColors.yellow,
        //   chartColors.green,
        //   chartColors.blue,
        // ],
        hoverOffset: 4
      }]
    },
    options: {
      cutout: '60%',
      responsive: true,
      layout: {
        padding: 20
      },
      plugins: {
        legend: {
          display: false,
          position: 'right',
        },
        animation: {
          animateScale: true,
          animateRotate: true
        }
      }
    }
  });

}

export {donutChart}