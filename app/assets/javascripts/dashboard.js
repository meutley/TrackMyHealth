var Dashboard = Dashboard || (function () {
    var $newLinkTemplate = $('<a>').addClass('new-link-hover').html('<i class="fa fa-plus"></i>&nbsp;Add new...');
    
    var _init = () => {
        var $cardsWithShowNew = $('.card-body.show-new-link');
        $.each($cardsWithShowNew, (index, card) => {
            var $card = $(card);
            var newLink = $card.data('new-link');
            if (newLink) {
                var $newLinkElement = $newLinkTemplate.clone();
                $newLinkElement.attr('href', newLink);
                $card.append($newLinkElement);
            }
        });
    }

    return {
        init: _init
    }
})();

Dashboard.Customize = Dashboard.Customize || (function () {
    var _init = () => {
        var $form = $('#customize-dashboard-form');
        var formAction = $form.attr('action');
        var formMethod = $form.attr('method');
        var $btnSubmit = $($form.find('#btn-submit')[0]);
        var $responseMessage = $('#response-message');
        
        var $availableModules = $('#available-modules');
        var $activeModules = $('#active-modules');

        App.Plugins.MovableList.init($activeModules, $('#btn-move-up'), $('#btn-move-down'));
        App.Plugins.SwappableList.init($activeModules, $availableModules, $('#btn-make-available'), $('#btn-make-active'));

        $form.off('submit');
        $form.on('submit', (e) => {
            e.preventDefault();

            $responseMessage.hide();
            $btnSubmit.attr('disabled', 'disabled');

            var $activeModulesOptions = $activeModules.find('option');
            var activeModules = [];
            $.each($activeModulesOptions, (index, option) => {
                activeModules.push($(option).val());
            });

            $.ajax({
                url: formAction,
                method: formMethod,
                beforeSend: function(xhr) {
                            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
                },
                data: {
                    activeModules: activeModules
                }
            }).done((res) => {
                $responseMessage.removeClass('text-danger').addClass('text-success').text(res.message);
            }).fail((err) => {
                $responseMessage.removeClass('text-success').addClass('text-danger').text(err.message);
            }).always(() => {
                $responseMessage.show();
                $btnSubmit.removeAttr('disabled');
            });
        });
    }
    
    return {
        init: _init
    }
})();