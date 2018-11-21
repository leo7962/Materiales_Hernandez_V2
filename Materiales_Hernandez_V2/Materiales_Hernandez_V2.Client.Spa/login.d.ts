import { ViewModel } from 'xomega';
declare class Login extends ViewModel {
    getView(): HTMLDivElement;
    activate(query: any): void;
    private getLoginRequest;
}
export = Login;
