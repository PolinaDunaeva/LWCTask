import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import getAccountByType from '@salesforce/apex/AccountController.getAccountByType';
import getSumm from '@salesforce/apex/AccountController.getSumm';
import getAllAccSumm from '@salesforce/apex/AccountController.getAllAccSumm';
import getAllSumm from '@salesforce/apex/AccountController.getAllSumm';
import getAllSum from '@salesforce/apex/AccountController.getAllSum';

export default class List extends LightningElement {
    @track accounts;
    @track summa;
    @track selectedId;
    @track error;
    @track value = 'All types';
    @track accName;
    @track accType;
    @track accInd;
    @track accBudg;
    @track accDescr;
    @track res = 0;
    @track sum;

    connectedCallback(){
        getAccounts()
        .then(result => {
            this.accounts = result;
            this.error = undefined;
            for(let i=0; i<this.accounts.length; i++){
                this.res+=this.accounts[i].Budget__c
            }
        })
        .catch(error => {
            this.error = error;
            this.accounts = undefined;
        });

        getAllAccSumm()
            .then(result => {
                this.summa = result;
            })
            .catch(error => {
                this.error = error;
            }); 

        getAllSumm()
            .then(result => {
                this.sum = result;
            })
            .catch(error => {
                this.error = error;
            }); 
    }    

    get options() {
        return [
            { label: 'All types', value: 'All types' },
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Channel Partner / Reseller', value: 'Channel Partner / Reseller' },
            { label: 'Technology Partner', value: 'Technology Partner' },
            { label: 'Other', value: 'Other' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
        if(this.value == 'All types'){
            getAccounts()
            .then(result => {
               this.accounts = result;
               this.res = 0;
               for(let i=0; i<this.accounts.length; i++){
                this.res+=this.accounts[i].Budget__c
            }
            })
            .catch(error => {
                this.error = error;
            });
            
            getAllAccSumm()
            .then(result => {
                this.summa = result;
            })
            .catch(error => {
                this.error = error;
            });

            getAllSumm()
            .then(result => {
                this.sum = result;
            })
            .catch(error => {
                this.error = error;
            }); 
        }
        else{
        getAccountByType({
            type: this.value
        })
        .then(result => {
            this.accounts = result;
            this.res = 0;
            for(let i=0; i<this.accounts.length; i++){
                this.res+=this.accounts[i].Budget__c
            }
        })
        .catch(error => {
            this.error = error;
        });

        getSumm({
            type: this.value
        })
            .then(result => {
                this.summa = result;
            })
            .catch(error => {
                this.error = error;
            });

        getAllSum({
            type: this.value
        })
            .then(result => {
                this.sum = result;
            })
            .catch(error => {
                this.error = error;
            }); 
        }
    }

    handleObjectListItemSelected(event){
        this.selectedId = event.detail.setId;
        this.accName = event.detail.setName;
        this.accType = event.detail.setType;
        this.accInd = event.detail.setInd;
        this.accBudg = event.detail.setBudg;
        this.accDescr = event.detail.setDescr;
    }
}