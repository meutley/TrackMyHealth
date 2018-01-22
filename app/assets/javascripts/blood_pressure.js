var BloodPressure = BloodPressure || {};

BloodPressure.NewEntry = BloodPressure.NewEntry || (function () {
    var _init = () => {
        Application.Common.setupDateTimePickers();
    }

    return {
        init: _init
    }
})();