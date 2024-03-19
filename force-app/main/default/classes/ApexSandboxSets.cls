public with sharing class ApexSandboxSets {
  public ApexSandboxSets() {
  }

  
  public Boolean containsDuplicates(List<Integer> nums) {
    Set<Integer> seen = new Set<Integer>();
    for (Integer i=0; i<nums.size(); i++) {
        if (seen.contains(nums[i])) return true;
        seen.add(nums[i]);
    }

    return false;
  }

  public Boolean sameElements(List<Integer> nums1, List<Integer> nums2) {
    Set<Integer> set1 = New Set<Integer>(nums1);
    Set<Integer> set2 = New Set<Integer>(nums2);

    return set1.equals(set2);
  }

  public Set<Id> accountIds(List<Opportunity> opps) {
    Set<Id> ids = New Set<Id>();

    for (Opportunity opp : opps) {
        if(!ids.contains(opp.AccountId) && null != opp.AccountId) {
            ids.add(opp.AccountId);
        }
    }

    return ids;
  }

  public Set<Integer> setIntersection(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> set3 = New Set<Integer>();

    for (Integer st1 : set1) {
        for (Integer st2 : set2) {
            if(st1 == st2) {
                set3.add(st1);
            }
        }
    }

    return set3;
  }

  public Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> set3 = New Set<Integer>(set1);

    set3.addAll(set2);

    return set3;
  }

}