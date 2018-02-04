var BloodGlucose = BloodGlucose || {};

BloodGlucose.NewEntry = BloodGlucose.NewEntry || (function () {
    var _init = () => {
        Application.Common.setupDateTimePickers();
    }

    return {
        init: _init
    }
})();

BloodGlucose.EditEntry = BloodGlucose.EditEntry || (function () {
  var _init = () => {
      Application.Common.setupDateTimePickers();
  }

  return {
      init: _init
  }
})();