var Analytics = Analytics || {};

Analytics.BloodPressure = Analytics.BloodPressure || (function () {
    var okayBackgroundColor = '#33ff11';
    var warningBackgroundColor = '#ffdd22';
    var dangerBackgroundColor = '#ff2233';
    
    var _init = () => {
        $.ajax({
            url: '/analytics/blood_pressure_data',
            method: 'GET'
        }).then((res) => {
            var data = res.blood_pressure_measurements;
            _buildPressureTrendsChart(data.map((m) => {
                return {
                    date: m.datetime,
                    systolic: m.systolic,
                    diastolic: m.diastolic
                }
            }));
        });
    }

    var _buildPressureTrendsChart = (systolicMeasurements) => {
        var ctx = document.getElementById("pressure-trends").getContext('2d');
        var pressureTrendsChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: systolicMeasurements.map(m => m.date),
                // Stack systolic and diastolic together (side by side)
                datasets: [{
                    label: 'Systolic Pressure',
                    data: systolicMeasurements.map(m => m.systolic),
                    borderWidth: 1
                }, {
                    label: 'Diastolic Pressure',
                    data: systolicMeasurements.map(m => m.diastolic),
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });

        // Set background colors based on danger/warning zones
        var datasets = pressureTrendsChart.data.datasets;
        _setPressureTrendsBackgroundColors(pressureTrendsChart, datasets[0], 140, 130);
        _setPressureTrendsBackgroundColors(pressureTrendsChart, datasets[1], 90, 85);
    }

    var _setPressureTrendsBackgroundColors = (chart, dataset, danger, warning, okay) => {
        var backgroundColors = [];
        $.each(dataset.data, (index, d) => {
            backgroundColors.push(_getSeverityColor(d, danger, warning, okay));
        });
        dataset.backgroundColor = backgroundColors;
        chart.update();
    }

    var _getSeverityColor = (value, danger, warning, okay) => {
        var color = okayBackgroundColor;
        if (value > danger) {
            color = dangerBackgroundColor;
        } else if (value > warning) {
            color = warningBackgroundColor;
        } else if (okay && value > okay) {
            color = okayBackgroundColor;
        }

        return color;
    }

    return {
        init: _init
    }
})();