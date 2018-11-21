define(["require", "exports", "xomega"], function (require, exports, xomega_1) {
    "use strict";
    var MessageListWidget = /** @class */ (function () {
        function MessageListWidget() {
        }
        MessageListWidget.prototype.activate = function (settings) {
            this.settings = settings;
        };
        MessageListWidget.prototype.iconClass = function (severity) {
            switch (severity) {
                case xomega_1.ErrorSeverity.Critical:
                case xomega_1.ErrorSeverity.Error: return 'fa-exclamation-circle';
                case xomega_1.ErrorSeverity.Warning: return 'fa-times-circle';
                case xomega_1.ErrorSeverity.Info: return 'fa-info-circle';
            }
            return '';
        };
        return MessageListWidget;
    }());
    return MessageListWidget;
});
//# sourceMappingURL=viewmodel.js.map