var Analytics = Analytics || (function () {
    var _toggleNoDataMessage = function (visible, message) {
        var $messageContainer = $('.no-data-container');
        var $analyticsData = $('.analytics-data');
        if ($messageContainer) {
            if (!visible) {
                $analyticsData.show();
                $messageContainer.hide();
            } else {
                if (message !== undefined && message !== null) {
                    $messageContainer.find('.message').text(message);
                }

                $analyticsData.hide();
                $messageContainer.show();
            }
        }
    }

    return {
        toggleNoDataMessage: _toggleNoDataMessage
    }
})();