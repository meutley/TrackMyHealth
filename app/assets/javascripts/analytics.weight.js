var Analytics = Analytics || {};

Analytics.Weight = Analytics.Weight || (function () {
    var lineColor = '#4390EF';
    
    var _init = () => {
        $.ajax({
            url: '/analytics/weight_data',
            method: 'GET'
        }).then((res) => {
            var model = res.model;
            var data = model.weight_measurements;
            if (data.length === 0) {
                Analytics.toggleNoDataMessage(true);
            } else {
                _buildWeightTrendsChart(model.unit, data.map((m) => {
                    return {
                        date: m.datetime,
                        value: m.value
                    }
                }));

                $('.min-value').text(model.min);
                $('.max-value').text(model.max);
                $('.average-value').text(model.average);
            }
        });
    }

    var _buildWeightTrendsChart = (unit, weights) => {
        var ctx = document.getElementById("weight-trends").getContext('2d');
        var weightTrendsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: weights.map(m => m.date),
                datasets: [{
                    label: 'Weight (' + unit + ')',
                    data: weights.map(m => m.value),
                    borderColor: lineColor,
                    fill: '#000',
                    lineTension: 0
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: false
                        }
                    }]
                }
            }
        });
    }

    return {
        init: _init
    }
})();