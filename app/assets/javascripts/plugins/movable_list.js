var App = App || {};
App.Plugins = App.Plugins || {};

App.Plugins.MovableList = App.Plugins.MovableList || (function ($) {
    var _init = function ($element, $btnMoveUp, $btnMoveDown) {
        $btnMoveUp.off('click');
        $btnMoveUp.on('click', function (e) {
            e.preventDefault();
            _moveUp($element);
        });

        $btnMoveDown.off('click');
        $btnMoveDown.on('click', function (e) {
            e.preventDefault();
            _moveDown($element);
        });
    }
    
    var _moveUp = function ($element) {
        var $selectedOptions = $element.find('option:selected');
        var $allOptions = $element.find('option');
        $selectedOptions.each(function() {
            var newPos = $allOptions.index(this) - 1;
            if (newPos > -1) {
                $allOptions.eq(newPos).before("<option value=" + $(this).val() + " selected='selected'>" + $(this).text() + "</option>");
                $(this).remove();
            }
        });
    }

    var _moveDown = function ($element) {
        var $selectedOptions = $element.find('option:selected');
        var $allOptions = $element.find('option');
        var countOptions = $allOptions.length;
        $selectedOptions.each(function() {
            var newPos = $allOptions.index(this) + 1;
            if (newPos < countOptions) {
                $allOptions.eq(newPos).after("<option value=" + $(this).val() + " selected='selected'>" + $(this).text() + "</option>");
                $(this).remove();
            }
        });
    }

    return {
        init: _init
    }
})(jQuery);