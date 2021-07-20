@isTest
private class AccountControllerTest {
    @isTest static void testGetAccounts() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        insert acc1;
        Account acc2 = new Account();
        acc2.Name = 'acc 2';
        insert acc2;
        List<Account> listAcc = AccountController.getAccounts();
        Integer listSize = listAcc.size();
        System.assertEquals(2, listSize);
    }

    @isTest static void testGetAccountByType() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        acc1.Type = 'Customer - Direct';
        insert acc1;
        List<Account> listAcc = AccountController.getAccountByType('Customer - Direct');
        Integer listSize = listAcc.size();
        System.assertEquals(1, listSize);
    }

    @isTest static void testGetSumm() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        acc1.Type = 'Customer - Direct';
        acc1.Budget__c = 100;
        insert acc1;
        Account acc2 = new Account();
        acc2.Name = 'acc 2';
        acc2.Type = 'Customer - Direct';
        acc2.Budget__c = 200;
        insert acc2;
        Object accSum = AccountController.getSumm('Customer - Direct');
        System.assertEquals(300, accSum);
    }

    @isTest static void testGetAllAccSumm() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        acc1.Budget__c = 100;
        insert acc1;
        Account acc2 = new Account();
        acc2.Name = 'acc 2';
        acc2.Budget__c = 200;
        insert acc2;
        Object accSum = AccountController.getAllAccSumm();
        System.assertEquals(300, accSum);
    }

    @isTest static void testGetAllSumm() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        acc1.Budget__c = 100;
        insert acc1;
        Account acc2 = new Account();
        acc2.Name = 'acc 2';
        acc2.Budget__c = 200;
        insert acc2;
        Decimal accSum = AccountController.getAllSumm();
        System.assertEquals(300, accSum);
    }

    @isTest static void testGetAllSum() {
        Account acc1 = new Account();
        acc1.Name = 'acc 1';
        acc1.Type = 'Customer - Direct';
        acc1.Budget__c = 100;
        insert acc1;
        Account acc2 = new Account();
        acc2.Name = 'acc 2';
        acc2.Type = 'Customer - Direct';
        acc2.Budget__c = 200;
        insert acc2;
        Decimal accSum = AccountController.getAllSum('Customer - Direct');
        System.assertEquals(300, accSum);
    }
}
