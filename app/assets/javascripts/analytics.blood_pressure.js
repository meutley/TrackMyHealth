var Analytics = Analytics || {};

Analytics.BloodPressure = Analytics.BloodPressure || (function () {
    const lineChartBorderColor = '#888';
    const okayBackgroundColor = '#33ff11';
    const warningBackgroundColor = '#ffdd22';
    const dangerBackgroundColor = '#ff2233';
    
    const defaultChartType = 'bar';
    
    var _init = () => {
        this.chartType = defaultChartType;

        _buildChart();

        $('#btn-refresh-chart').off('click');
        $('#btn-refresh-chart').on('click', () => _buildChart());

        $('#chart-type-list').off('change');
        $('#chart-type-list').on('change', () => {
            const value = $('#chart-type-list').find('option:selected').val();
            this.chartType = value;
            _buildChart();
        });
    }

    var _buildChart = () => {
        $('#pressure-trends').hide();
        $('#loading-indicator').show();
        
        $.ajax({
            url: '/analytics/blood_pressure_data',
            method: 'GET'
        }).then((res) => {
            var data = res.blood_pressure_measurements;
            if (data.length === 0) {
                Analytics.toggleNoDataMessage(true);
            } else {
                _buildPressureTrendsChart(this.chartType, data.map((m) => {
                    return {
                        date: m.datetime,
                        systolic: m.systolic,
                        diastolic: m.diastolic
                    }
                }));
            }
        }).always(() => {
            $('#loading-indicator').hide();
            $('#pressure-trends').show();
        });
    };

    var _buildPressureTrendsChart = (chartType, measurements) => {
        var ctx = document.getElementById("pressure-trends").getContext('2d');
        if (this.pressureTrendsChart) {
            this.pressureTrendsChart.destroy();
        }
        
        this.pressureTrendsChart = new Chart(ctx, {
            type: chartType,
            data: {
                labels: measurements.map(m => m.date),
                // Stack systolic and diastolic together (side by side)
                datasets: [{
                    label: 'Systolic Pressure',
                    data: measurements.map(m => m.systolic),
                    borderWidth: 1,
                    lineTension: 0,
                    fill: ''
                }, {
                    label: 'Diastolic Pressure',
                    data: measurements.map(m => m.diastolic),
                    borderWidth: 1,
                    lineTension: 0,
                    fill: ''
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        // Set background colors based on danger/warning zones
        var datasets = pressureTrendsChart.data.datasets;
        _setPressureTrendsBackgroundColors(pressureTrendsChart, chartType, datasets[0], 140, 130);
        _setPressureTrendsBackgroundColors(pressureTrendsChart, chartType, datasets[1], 90, 85);
    }

    var _setPressureTrendsBackgroundColors = (chart, chartType, dataset, danger, warning, okay) => {
        var backgroundColors = [];
        $.each(dataset.data, (index, d) => {
            backgroundColors.push(_getSeverityColor(d, danger, warning, okay));
        });

        const isLineChart = chartType === 'line';
        dataset.backgroundColor = backgroundColors;
        dataset.pointBackgroundColor = dataset.pointBorderColor = isLineChart ? backgroundColors : '';
        dataset.borderColor = isLineChart ? lineChartBorderColor : '';
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