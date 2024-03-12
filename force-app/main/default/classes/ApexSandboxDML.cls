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

    public Id insertCourse(String name, String details, Integer credits) {
        if (credits >= 1 && credits <= 4) {
            credits = credits;
        }
        else {
            return null;
        }
        try {
            apxio__Course__c course = new apxio__Course__c();
            course.Name = name;
            course.apxio__Course_Details__c = details;
            course.apxio__Credits__c = String.valueOf(credits);
            insert course;
            return course.Id;
        }
        catch (DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;
        } 
    }
    
    public String registerStudent(String name, String phone, String email) {
        try {
            apxio__Student__c student = new apxio__Student__c();
            student.Name = name;
            student.apxio__Email__c = email;
            student.apxio__Phone__c = phone;
            insert student;
            apxio__Student__c stud = [Select Id, apxio__Registration_Number__c from apxio__Student__c Where Id = :student.Id];
            return stud.apxio__Registration_Number__c;
        }
        catch (DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;
        } 
    }

    public List<apxio__Student__c> selectActiveStudents() {
        try {
        List<apxio__Student__c> students = [Select Id, apxio__Active__c, Name
                                            From apxio__Student__c 
                                            Where apxio__Active__c = true AND Name != Null];
        return students;
        }
        catch (DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;
        } 
    }

public List<apxio__Student__c> selectUnreachableStudents() {
    try {
        List<apxio__Student__c> students = [
            Select Id, Name
            From apxio__Student__c
            Where apxio__Active__c = true And apxio__Email__c = null And apxio__Phone__c = null
            Order By Name asc
        ];
        return students;
    }
    catch (DmlException e) {
        System.debug('Error:== ' + e.getMessage());
        return null;
    } 
}

public List<apxio__Student__c> selectStudentsWithoutContactInfo() {
    try {
         List<apxio__Student__c> students = [
             Select Id, Name
             From apxio__Student__c
             Where apxio__Active__c = true And (apxio__Email__c = null Or apxio__Phone__c = null)
             Order By Name asc
         ];
         return students;
     }
     catch (DmlException e) {
         System.debug('Error:== ' + e.getMessage());
         return null;
     } 
 }

 public void createCourseAndClass(String name, String description) {
    try {
        apxio__Course__c course = new apxio__Course__c();
        course.Name = name;
        course.apxio__Course_Details__c = description;
        insert course;

        apxio__Class__c cls = new apxio__Class__c();
        cls.Name = name;
        cls.apxio__Description__c = description?.left(255);
        cls.apxio__Course__c = course.Id;
        insert cls;
    }
    catch (DmlException e) {
        System.debug('Error:== ' + e.getMessage());
    }

    public void insertStudents(List<String> studentNames, List<String> studentEmails) {
        try {
            List<apxio__Student__c> students = new List<apxio__Student__c>();
    
            for (Integer i = 0; i < studentNames.size(); i++) {
                apxio__Student__c student = new apxio__Student__c();
                student.Name = studentNames[i];
                student.apxio__Email__c = studentEmails[i];
                students.add(student);
            }
    
            insert students;
        }
        catch (DmlException e){
            System.debug('Error:== ' + e.getMessage());
        }
    }


}


}