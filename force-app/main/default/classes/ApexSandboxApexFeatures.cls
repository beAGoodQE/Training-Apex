public with sharing class ApexSandboxApexFeatures {
    public ApexSandboxApexFeatures() {

    }

    public Boolean isTypeAccount(sObject record) {
        return (record instanceof Account);
    }

    public String convert15to18DigitId(String fifteenDigit) {
        if (String.isBlank(fifteenDigit)) {
            return null;
        }
        else if (fifteenDigit.length() != 15) {
            return '-1';
        }
        else {
            Id eighteenDigit = fifteenDigit;
            return eighteenDigit;
        }
    }

    public String divide(Integer a, Integer b){
        if (0 == b) {
            return 'Divide by 0';
        }
        try {
            if (0 == b) {
                return 'Divide by 0';
            }
            Integer c = a / b;
            return String.valueOf(c);
        }
        catch (Exception e) {
            return e.getMessage();
        }
    }

    public List<Account> checkAccounts(List<Account> accounts) {
        List<Account> noBillingCityList = new List<Account>();
    
        if (null == accounts) {
            throw new IllegalArgumentException('accounts should not be null');
        }
    
        // Populate List with Accounts with null BillingCity
        for (Account account : accounts) {
            if (account.BillingCity == null || account.BillingCity == '') {
                noBillingCityList.add(account);
            }
        }
        // If all BillingCity's are populated, the list size will be 0, return original list
        if (noBillingCityList.size() == 0) {
            return accounts;
        }
        else {
            throw new AccountException('Invalid BillingCity');
        }
    }
    
    //do not remove the following custom-defined exception
    public class AccountException extends Exception {}

    public String getAccountBillingCityWithSafeNavigation(List<Account> accounts){
        String billingCity = accounts[0].BillingCity?.toUpperCase();
        return billingCity;
    }

    public List<String> getFieldsValue(Account acc, List<String> fields) {
        List<String> fieldValues = new List<String>();
    
        for (String singleField : fields) {
            fieldValues.add(String.valueOf(acc.get(singleField)));
        }
    
        return fieldValues;
    }

    public String getAccountsInJSONFormat(List<Account> accounts){
        return JSON.serialize(accounts);
      }

      public List<sObject> getListOfsObject(List<Account> accounts, List<Contact> contacts) {
        List<sObject> results = new List<sObject>();
    
        if (accounts != null) {
            for (Account account : accounts) {
                results.add(account);
            }
        }
        
        if (contacts != null) {
            for (Contact contact : contacts) {
                results.add(contact);
            }
        }
    
        return results;
    }

    public List<Account> getAccountsFromJSONString(String inputJSON){
        // isBlank() checks for both null and '' (empty)
        if (String.isBlank(inputJSON)) {
            return null;
        }
    
        List<Account> results = (List<Account>)JSON.deserialize(inputJSON, List<Account>.class);
        return results;
    }

    public Map<String,String> getContextUserInformation(){
        Map<String, String> userInfoMap = new Map<String, String>();
    
        userInfoMap.put('EmailId', UserInfo.getUserEmail());
        userInfoMap.put('ProfileId', UserInfo.getProfileId());
        userInfoMap.put('Type', UserInfo.getUserType());
        userInfoMap.put('UserName', UserInfo.getUserName());
    
        return userInfoMap;
    }

    public void validateInsert(List<Opportunity> opportunities){
        String msg = 'Description should not be empty for Closed Won opportunity.';
    
        for (Opportunity opp : opportunities) {
            if ((opp.StageName == 'Closed Won') && (opp.Description == null || opp.Description == '')) {
                opp.Description.addError(msg);
            }
        }
    }

    public List<Account> getAccounts(List<Account> accounts) {
        if(accounts == null) return null;
        AccountWrapper[] accList=new List<AccountWrapper>();
    
        for(Account a:accounts){
            accList.add(new AccountWrapper(a));
        }
        accList.sort();
        accounts.clear();
        
        for(AccountWrapper a:accList) {
            accounts.add(a.account);
        }
    
        return accounts;
    }
    
    // write extra class here 
    public class AccountWrapper implements Comparable{
        public Account account;
        public AccountWrapper(Account acc){
            if(acc==null){
                Exception ex = new NullPointerException();
                ex.setMessage('Account argument cannot be null'); 
                throw ex;
           }
           account=acc;
        }
    
        public Integer compareTo(Object compareTo){
            AccountWrapper compareToAcc=(AccountWrapper) compareTo;
            Integer returnVal=0;
            if(account.AnnualRevenue ==null &&  compareToAcc.account.AnnualRevenue ==null){
                returnVal=0;
            } else if(account.AnnualRevenue ==null &&  compareToAcc.account.AnnualRevenue !=null){
                returnVal=-1;
            } else if(account.AnnualRevenue !=null &&  compareToAcc.account.AnnualRevenue ==null){
                returnVal=1;
            } else if (account.AnnualRevenue > compareToAcc.account.AnnualRevenue){
                returnVal=-1;
            } else if (account.AnnualRevenue < compareToAcc.account.AnnualRevenue){
                returnVal=1;
            }
            return returnVal;
        }
    }
    

}