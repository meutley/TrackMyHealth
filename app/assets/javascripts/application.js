// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require bootstrap
//= require Chart.2.7.1.min
//= require moment.min
//= require tempusdominus-bootstrap-4.min
//= require_tree .

var Application = Application || {};

Application.Common = Application.Common || (function () {
    var _setupDateTimePickers = () => {
        $('.date-time-picker').datetimepicker({
            format: 'YYYY-MM-d'
        });

        $('.date-time-picker').on('keypress', (e) => {
            e.preventDefault();
        });

        $('.date-time-picker').focus(function () {
            $(this).blur();
        });

        $('.input-group.date > .input-group-append[data-clear="datetimepicker"]').on('click', function () {
            var dataTarget = $(this).data('target');
            var $target = $(dataTarget).find('input[type=text]');
            if ($target.length > 0) {
                $target.val('');
            }
        });
    }

    return {
        setupDateTimePickers: _setupDateTimePickers
    }
})();
