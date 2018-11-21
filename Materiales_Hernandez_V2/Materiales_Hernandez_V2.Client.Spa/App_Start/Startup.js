define(["require", "exports", "durandal/app", "durandal/system", "plugins/router", "xomega"], function (require, exports, durandalApp, system, router, xomega_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    // Configure and run Durandal application
    system.debug(true); // enable output of debug messages to console
    var app = durandalApp;
    app.title = document.title;
    // configure Durandal plugins
    app.configurePlugins({
        router: true,
        widget: {
            kinds: ['criteria', 'msglist', 'pager', 'panel']
        }
    });
    // configure Xomega date/time formats
    xomega_1.DateTimeProperty.DefaultEditFormat = 'M/D/YYYY HH:mm';
    xomega_1.DateProperty.DefaultEditFormat = 'M/D/YYYY';
    xomega_1.TimeProperty.DefaultEditFormat = 'HH:mm';
    // configure Xomega API access and authentication behavior
    xomega_1.AuthManager.ApiRoot = 'http://localhost:58395/'; // set root URL for web api
    xomega_1.AuthManager.Current.handleUnauthorizedResponse(); // sign out on 401 (Unauthorized)
    xomega_1.AuthManager.Current.LoggedIn.subscribe(function (val) {
        if (val)
            return;
        router.navigate('#' + xomega_1.AuthManager.Current.getLoginUrl(router.activeInstruction()));
    });
    // disable cache during AJAX calls in JQuery to fix IE issues
    $.ajaxSetup({
        cache: false
    });
    // start the app, and load the main view
    app.start().then(function () { return app.setRoot('shell'); });
});
//# sourceMappingURL=Startup.js.map