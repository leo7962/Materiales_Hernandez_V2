define(["require", "exports"], function (require, exports) {
    "use strict";
    var AppliedCriteriaWidget = /** @class */ (function () {
        function AppliedCriteriaWidget() {
        }
        AppliedCriteriaWidget.prototype.activate = function (settings) {
            this.settings = settings;
            if (!settings.title)
                settings.title = 'Search Criteria';
        };
        return AppliedCriteriaWidget;
    }());
    return AppliedCriteriaWidget;
});
//# sourceMappingURL=viewmodel.js.map