/**
* @author Brian Kayser
* @date 03-20-2024
* @description - Apex Training Class
*/

public with sharing class AccountWrapper {
  Account thisAccount;

  /**
  * @author Brian Kayser
  * @date 03-20-2024
  * @description - Apex Training Sub-Class
  */
  public class AWException extends exception{}

  /** @description - Apex Training Sub-Class
   *  @param startWith input Account to use
   */
  public AccountWrapper(Account startWith){
    thisAccount = startWith;
  }

  /** @description - Apex Training Sub-Class
  *  @return - Average price of Opportunities
  */
  public decimal getRoundedAvgPriceOfOpps(){
    AggregateResult[] ar = [SELECT AVG(Amount) 
                            FROM Opportunity 
                            WHERE accountId = :thisAccount.id
                            WITH USER_MODE];
    Decimal average = (Decimal) ar[0].get('expr0'); 
    Long modulus = Math.mod(Integer.valueOf(average), 1000);
    Decimal returnValue = (modulus >= 500) ? (average + 1000) - modulus : average - modulus;
    if(returnValue <= 0) { 
      throw new AWException('No won Opportunities');
    }
    return returnValue;
  }

  /** @description - Apex Training Sub-Class
  *  @return - Boolean High Priority
  */
  @TestVisible
  public Boolean isHighPriority(){
    if(getRoundedAvgPriceOfOpps() > 100000.00){
      return true;
    }
    return false;
  }
}