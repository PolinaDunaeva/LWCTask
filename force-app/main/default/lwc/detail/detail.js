import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class Detail extends NavigationMixin(LightningElement) {
    @api aname
    @api atype
    @api aind
    @api abudg
    @api adescr
    @api aid

    navigateToAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.aid,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
}