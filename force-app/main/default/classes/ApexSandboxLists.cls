public with sharing class ApexSandboxSObjects {
  public ApexSandboxSObjects() {
  
  }

  public Boolean duplicateContacts(Contact c1, Contact c2) {
    return (c1.Email != null && c1.Email == c2.Email) || (c1.Phone != null && c1.Phone == c2.Phone);
  }

  public void setAccountRating(Account a) {
    if (a.AnnualRevenue <= 100000) {
        a.Rating = 'Cold';
    }
    else if (a.AnnualRevenue <= 500000) {
        a.Rating = 'Warm';
    }
    else {
        a.Rating = 'Hot';
    }
  }

  public Boolean isBirthday(Contact c) {
    Integer mm = c.Birthdate.month();
    Integer dd = c.Birthdate.day();

    Date todaysDate = Date.today();

    if (mm == todaysDate.month() && dd == todaysDate.day()) {
        return true;
    }
    else {
        return false;
    }
  }

  public Boolean isKeyAccount(Account a) {

    Boolean isKeyAccount;
    switch on a.Industry {
        when 'Banking' {
            isKeyAccount = a.AnnualRevenue >= 600000;
        }
        when 'Technology' {
            isKeyAccount = a.AnnualRevenue >=  800000;
        }
        when 'Retail' {
            isKeyAccount = a.AnnualRevenue >=  2000000;
        }
        when else {
            isKeyAccount = a.AnnualRevenue >= 500000;
        }
    }
    return isKeyAccount;
  }

  public void escalateIfMeetsCriteria(Case c) {
    if ((c.Type == 'Mechanical' || c.Type == 'Electrical') && c.Reason == 'Breakdown' && c.Status == 'In Progress') {
        c.IsEscalated = true;
    }
  }

  public Boolean sameParent(Contact c, Opportunity opp) {
    if (c.AccountId == null || opp.AccountId == null) {
        return false;
    }
    else {
        return (c.AccountId == opp.AccountId);
    }
  }

  public Boolean sameParent(Account acc, Contact con, Opportunity opp) {
    if (acc.Id == null || con.AccountId == null || opp.AccountId == null) {
        return false;
    }
    else {
        return (acc.Id == con.AccountId && acc.Id == opp.AccountId);
    }
  }

  public void setParent(Account acc, Contact con, Opportunity opp) {

    if (acc != null && acc.Id != null) {
        con.AccountId = acc.Id;
        opp.AccountId = acc.Id;
    }
  }

  public void linkParent(Case c1, Case c2) {

    if (c1.ContactId != null && c2.ContactId != null && c1.ContactId == c2.ContactId) {
        if (c1.CreatedDate < c2.CreatedDate) {
            c2.ParentId = c1.Id;
        }
        else if (c2.CreatedDate < c1.CreatedDate) {
            c1.ParentId = c2.Id;
        }
        else {
            c1.ParentId = null;
            c2.ParentId = null;
        }
    }
}


}