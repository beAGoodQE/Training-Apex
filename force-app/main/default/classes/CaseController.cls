public with sharing class CaseController {
    public CaseController() {
    }

    public void testCaseViewInSystemMode() {
        List<Case> allCases = [Select Id, Subject From Case With SYSTEM_MODE];
        System.debug('# of cases: ' + allCases.size());
    }

    // execute 'new CaseController().testCaseView();' in Anon Apex
    public void testCaseView() {
        List<Case> allCases = [Select Id, Subject From Case With USER_MODE];
        System.debug('# of cases: ' + allCases.size());
    }

    public void testCaseCreationInUserMode() {
        Case case1 = new Case (Status='New', Origin='Email', Subject='My iphone is broken');
        Database.insert(case1, AccessLevel.USER_MODE);
    }

    public void testCaseCreationInSystemMode() {
        Case case1 = new Case (Status='New', Origin='Email', Subject='My iphone is broken');
        Database.insert(case1, AccessLevel.SYSTEM_MODE);
    }

}