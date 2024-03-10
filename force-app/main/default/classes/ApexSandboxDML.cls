public with sharing class ApexSandboxDML {
    public ApexSandboxDML() {

    }

    public Id insertStudent(String name, String email) {
        try {
            apxio__Student__c student = new apxio__Student__c();
            student.Name = name;
            student.apxio__Email__c = email;
            insert student;
            return student.Id;
        }
        catch (DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;
        } 
    }


}