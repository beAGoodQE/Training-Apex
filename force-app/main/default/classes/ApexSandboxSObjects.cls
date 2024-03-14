public with sharing class ApexSandboxLists {
  public ApexSandboxLists() {
  
  }

  public List<String> getNamesInAscOrder(List<String> accountNames) {
    accountNames?.sort();
    return accountNames;
}


}