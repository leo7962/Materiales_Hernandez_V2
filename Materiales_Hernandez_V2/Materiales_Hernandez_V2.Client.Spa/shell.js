define(["require", "exports", "Views/MainMenu", "durandal/app", "knockout", "plugins/router", "xomega"], function (require, exports, MainMenu_1, app, ko, router, xomega_1) {
    "use strict";
    // default routes configuration
    var Routes = [
        { route: '', moduleId: 'Views/home', title: 'Home', hash: '#' },
        { route: 'login', moduleId: 'login', title: 'Login', hash: '', allowAnonymous: true },
    ];
    var Shell = /** @class */ (function () {
        function Shell() {
            this.title = app.title;
            this.menu = [];
            this.loggedIn = ko.computed(function () { return xomega_1.AuthManager.Current.LoggedIn(); });
        }
        Shell.prototype.userName = function () {
            var am = xomega_1.AuthManager.Current;
            return am.LoggedIn() && am.Claims ? am.Claims.unique_name : '';
        };
        Shell.prototype.logout = function () {
            xomega_1.AuthManager.Current.signOut();
        };
        Shell.prototype.activate = function () {
            // map routes
            xomega_1.AuthManager.forEachItem(Routes, this.mapRoute, this);
            xomega_1.AuthManager.forEachItem(MainMenu_1.MainMenu, this.mapRoute, this);
            // build menu
            this.menu.push(Routes[0]); // home
            this.menu = this.menu.concat(MainMenu_1.MainMenu);
            xomega_1.AuthManager.forEachItem(this.menu, this.setUpRoles, this);
            xomega_1.AuthManager.forEachItem(this.menu, xomega_1.AuthManager.Current.setUpAllowed, xomega_1.AuthManager.Current);
            var rootRouter = router;
            rootRouter.guardRoute = xomega_1.AuthManager.guardRoute;
            return router.activate();
        };
        Shell.prototype.mapRoute = function (item) {
            if (item.route != null)
                router.map(item);
        };
        Shell.prototype.setUpRoles = function (item) {
            // TODO: check item.route and set item.roles array accordingly
        };
        return Shell;
    }());
    return Shell;
});
//# sourceMappingURL=shell.js.map