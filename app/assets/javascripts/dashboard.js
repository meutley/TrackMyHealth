var Dashboard = Dashboard || {};

Dashboard.Customize = Dashboard.Customize || (function () {
    var _init = () => {
        var $form = $('#customize-dashboard-form');
        var formAction = $form.attr('action');
        var formMethod = $form.attr('method');
        var $availableModules = $('#available-modules');
        var $activeModules = $('#active-modules');

        $('#btn-make-active').off('click');
        $('#btn-make-active').on('click', function (e) {
            e.preventDefault();

            $('#available-modules option:selected').each(function () {
                $('#active-modules').append('<option>' + $(this).text() + '</option>');
                $(this).remove();
            });
        });

        $('#btn-make-available').off('click');
        $('#btn-make-available').on('click', function (e) {
            e.preventDefault();

            $('#active-modules option:selected').each(function () {
                $('#available-modules').append('<option>' + $(this).text() + '</option>');
                $(this).remove();
            });
        });

        $('#btn-move-up').off('click');
        $('#btn-move-up').on('click', function (e) {
            e.preventDefault();

            $('#active-modules option:selected').each(function() {
                var newPos = $('#active-modules option').index(this) - 1;
                if (newPos > -1) {
                    $('#active-modules option').eq(newPos).before("<option selected='selected'>" + $(this).text() + "</option>");
                    $(this).remove();
                }
            });
        });

        $('#btn-move-down').off('click');
        $('#btn-move-down').on('click', function (e) {
            e.preventDefault();
            
            var countOptions = $('#active-modules option').length;
            $('#active-modules option:selected').each(function() {
                var newPos = $('#active-modules option').index(this) + 1;
                if (newPos < countOptions) {
                    $('#active-modules option').eq(newPos).after("<option selected='selected'>" + $(this).text() + "</option>");
                    $(this).remove();
                }
            });
        });

        $form.off('submit');
        $form.on('submit', (e) => {
            e.preventDefault();

            var $activeModulesOptions = $availableModules.find('option');
            var activeModules = [];
            var availableModules = $.each($activeModulesOptions, (index, option) => {
                activeModules.push($(option).text());
            });

            $.ajax({
                url: formAction,
                method: formMethod,
                data: {
                    activeModules: activeModules
                }
            }).then(() => {

            });
        });
    }
    
    return {
        init: _init
    };
})();