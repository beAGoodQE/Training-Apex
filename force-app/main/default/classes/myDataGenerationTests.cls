@isTest
private class myDataGenerationTests {
    // In Setup -> Static Resources add 'Mock_Data' with cache control Public pointing to the 'Mock Accounts.csv' file
    @TestSetup
    static void loadTestDataFromStaticResource(){
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
  
    @isTest static void testLoadAccountsFromStaticResource() {
        List<Account> accts = [SELECT ID FROM Account];
        system.assert(accts.size() == 15, 'expected 15 accounts');
    }
}