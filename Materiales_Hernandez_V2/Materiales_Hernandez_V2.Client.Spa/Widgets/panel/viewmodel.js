define(["require", "exports", "xomega"], function (require, exports, xomega_1) {
    "use strict";
    var PanelWidget = /** @class */ (function () {
        function PanelWidget() {
        }
        PanelWidget.prototype.activate = function (settings) {
            this.settings = settings;
            this.collapsed = xomega_1.makeObservable(settings.collapsed, false);
        };
        return PanelWidget;
    }());
    return PanelWidget;
});
//# sourceMappingURL=viewmodel.js.map