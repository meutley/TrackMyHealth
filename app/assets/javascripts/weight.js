var Weight = Weight || {};

Weight.NewEntry = Weight.NewEntry || (function () {
    var _init = () => {
        Application.Common.setupDateTimePickers();
    }

    return {
        init: _init
    }
})();

Weight.EditEntry = Weight.EditEntry || (function () {
  var _init = () => {
      Application.Common.setupDateTimePickers();
  }

  return {
      init: _init
  }
})();