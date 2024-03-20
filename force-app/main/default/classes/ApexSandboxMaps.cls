public with sharing class ApexSandboxMaps {
  public ApexSandboxMaps() {
  }

  public Map<String, List<Case>> casesByType(List<Case> cases) {
    Map<String, List<Case>> result = new Map<String, List<Case>>();

    for (Case cas : cases) {
        if (cas.Type != null) {
            if (result.containsKey(cas.Type)) {
                result.get(cas.Type).add(cas);
            }
            else {
                result.put(cas.Type, new List<Case> { cas });
            }
        }
    }

    return result;
  }

  public Map<String, Decimal> industrySummary(List<Account> accounts) {
    Map<String, Decimal> summary = new Map<String, Decimal>();

    for (Account account : accounts) {
        if (summary.containsKey(account.Industry)) {
            Decimal currentRevenue = summary.get(account.Industry);
            summary.put(account.Industry, currentRevenue + account.AnnualRevenue);
        }
        else {
            summary.put(account.Industry, account.AnnualRevenue);
        }
    }

    return summary;
  }

  public Map<String, Account> phoneToAccount(List<Account> accounts) {
    Map<String, Account> results = New Map<String, Account>();

    for (Account account : accounts) {
        if (null != account.Phone && '' != account.Phone) {
            results.put(account.Phone, account);
        }
    }
    
    return results;
  }
  
  public Map<String, String> phonebook(List<Contact> contacts) {
    Map<String, String> results = New Map<String, String>();

    for (Contact contact : contacts) {
        if (contact.Phone != '' && contact.Phone != null) {
            results.put(contact.Name, contact.Phone);
        }
    }

    return results;
  }

  public String employeeEmail(Map<String, String> employeeIdToEmail, String employeeId) {
    return employeeIdToEmail.containsKey(employeeId) ? employeeIdToEmail.get(employeeId) : 'info@apexsandbox.io';
    // This would also work:
    // return null == employeeIdToEmail.get(employeeId) ? 'info@apexsandbox.io' : employeeIdToEmail.get(employeeId);
  }

}