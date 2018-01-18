var Dashboard = Dashboard || {};

Dashboard.Customize = Dashboard.Customize || (function () {
    var _init = () => {
        var $form = $('#customize-dashboard-form');
        var formAction = $form.attr('action');
        var formMethod = $form.attr('method');
        var $availableModules = $('#available-modules');
        var $activeModules = $('#active-modules');

        App.Plugins.MovableList.init($activeModules, $('#btn-move-up'), $('#btn-move-down'));
        App.Plugins.SwappableList.init($activeModules, $availableModules, $('#btn-make-available'), $('#btn-make-active'));

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