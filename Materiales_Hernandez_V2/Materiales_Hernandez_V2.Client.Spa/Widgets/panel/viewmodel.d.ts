declare class PanelWidget {
    collapsed: KnockoutObservable<boolean>;
    settings: any;
    constructor();
    activate(settings: any): void;
}
export = PanelWidget;
