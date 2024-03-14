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


}