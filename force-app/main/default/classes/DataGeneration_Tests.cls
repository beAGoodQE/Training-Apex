@isTest
  private class DataGeneration_Tests {
    @isTest static void testBruteForceAccountCreation() {
      List<Account> accts = new List<Account>();
      Account a = new Account(name='McTesterson LLC');
      insert a;
      Test.startTest();
      accts = [SELECT Id FROM Account];
      Test.stopTest();
      System.assert(accts.size() > 0, 'Was expecting to find at least one account');
    }

	@isTest static void testUseTestFactoryToCreateAccountsWithContacts() {
		List<Account> accts;
		List<Contact> contacts;
        TestFactory.generateAccountWithContacts(5);

        Test.startTest();
		accts = [SELECT Id FROM Account];
		contacts = [SELECT Id FROM Contact];
		Test.stopTest();
  
        System.assert(accts.size() > 0, 'Was expecting to find at least one account');
		System.assertEquals(5, contacts.size(), 'Was expecting to find 5 contacts');
	}
}

