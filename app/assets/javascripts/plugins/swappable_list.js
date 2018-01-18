var App = App || {};
App.Plugins = App.Plugins || {};

App.Plugins.SwappableList = App.Plugins.SwappableList || (function ($) {
    var _init = function ($moveLeftList, $moveRightList, $btnMoveLeft, $btnMoveRight) {
        $btnMoveRight.off('click');
        $btnMoveRight.on('click', function (e) {
            e.preventDefault();
            _swapSelectionToList($moveRightList, $moveLeftList);
        });
        
        $btnMoveLeft.off('click');
        $btnMoveLeft.on('click', function (e) {
            e.preventDefault();
            _swapSelectionToList($moveLeftList, $moveRightList);
        });
    }

    var _swapSelectionToList = function ($sourceList, $targetList) {
        var $selectedOptions = $sourceList.find('option:selected');
        $selectedOptions.each(function () {
            $targetList.append("<option value=" + $(this).val() + ">" + $(this).text() + "</option>");
            $(this).remove();
        });
    }

    return {
        init: _init
    }
})(jQuery);