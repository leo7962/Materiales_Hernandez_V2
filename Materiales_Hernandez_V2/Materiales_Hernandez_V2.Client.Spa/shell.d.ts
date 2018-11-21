declare class Shell {
    title: string;
    menu: any;
    loggedIn: KnockoutComputed<boolean>;
    userName(): any;
    logout(): void;
    activate(): DurandalPromise<any>;
    private mapRoute;
    private setUpRoles;
}
export = Shell;
