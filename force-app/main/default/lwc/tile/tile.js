import { LightningElement, api } from 'lwc';
export default class Tile extends LightningElement {
    @api account;
    @api showDetail = false;
    handleSelect(){
        window.scroll(0,0);
        this.showDetail = true;
        this.dispatchEvent(
            new CustomEvent('objectlistitemselected', {
                detail:{
                    setId: this.account.Id,
                    setName: this.account.Name,
                    setType: this.account.Type,
                    setInd: this.account.Industry,
                    setBudg: this.account.Budget__c,
                    setDescr: this.account.Description
                }
            })
        );
    }
}
