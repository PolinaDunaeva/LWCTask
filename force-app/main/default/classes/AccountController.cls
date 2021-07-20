public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, Owner.Name, Budget__c, Number_of_Employees__c, Type, Picture_URL__C, Industry, Description
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByType(String type) {
        List<Account> accList = Database.query('SELECT Name, Owner.Name, Budget__c, Number_of_Employees__c, Type, Picture_URL__C, Industry, Description FROM Account WHERE Type = :type WITH SECURITY_ENFORCED ORDER BY Name');
        return accList;
    }

    @AuraEnabled(cacheable=true)
    public static Object getSumm(String type) {
        Object sm;
        AggregateResult[] groupedResults = [SELECT SUM(Budget__c) FROM Account WHERE Type = :type WITH SECURITY_ENFORCED];
        for (AggregateResult ar : groupedResults)  {
            sm = ar.get('expr0');
        }
        return sm;
    }

    @AuraEnabled(cacheable=true)
    public static Object getAllAccSumm() {
        Object sm;
        AggregateResult[] groupedResults = [SELECT SUM(Budget__c) FROM Account WITH SECURITY_ENFORCED];
        for (AggregateResult ar : groupedResults)  {
            sm = ar.get('expr0');
        }
        return sm;
    }

    @AuraEnabled(cacheable=true)
    public static Decimal getAllSumm() {
        Decimal sum = 0;
        List<Account> listBudg = [SELECT Budget__c FROM Account WITH SECURITY_ENFORCED];
        System.debug(listBudg);
        for(Account acc: listBudg){
            sum += acc.Budget__c;
        }
        return sum;
    }

    @AuraEnabled(cacheable=true)
    public static Decimal getAllSum(String type) {
        Decimal sum = 0;
        List<Account> listBudg = Database.query('SELECT Budget__c FROM Account WHERE Type = :type WITH SECURITY_ENFORCED');
        System.debug(listBudg);
        for(Account acc: listBudg){
            sum += acc.Budget__c;
        }
        return sum;
    }
}
