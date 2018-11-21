var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    }
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
define(["require", "exports", "plugins/router", "jwt_decode", "xomega"], function (require, exports, router, jwtDecode, xomega_1) {
    "use strict";
    var Login = /** @class */ (function (_super) {
        __extends(Login, _super);
        function Login() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Login.prototype.getView = function () {
            return document.createElement('div');
        };
        Login.prototype.activate = function (query) {
            // auto-login anonymously
            $.ajax(this.getLoginRequest());
        };
        Login.prototype.getLoginRequest = function () {
            var req = xomega_1.AuthManager.Current.createAjaxRequest();
            req.type = 'POST';
            req.url += 'oauth2/token';
            req.data = {
                grant_type: 'password',
            };
            var vm = this;
            req.success = function (data, textStatus, jqXHR) {
                var json = jqXHR.responseJSON;
                xomega_1.AuthManager.Current.signIn(json.access_token, jwtDecode(json.access_token));
                router.navigate('#' + vm.Params[xomega.AuthManager.ReturnParam]);
            };
            return req;
        };
        return Login;
    }(xomega_1.ViewModel));
    return Login;
});
//# sourceMappingURL=login.js.map