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
        // ? is "Safe Navigation" to ensure null is returned in case description is null
        cls.apxio__Description__c = description?.left(255);
        cls.apxio__Course__c = course.Id;
        insert cls;
    }
    catch (DmlException e) {
        System.debug('Error:== ' + e.getMessage());
    }

    void insertStudents(List<String> studentNames, List<String> studentEmails) {
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

    Id classFromCourse(String courseName) {
        try {
            List<apxio__Course__c> courses = [SELECT Id FROM apxio__Course__c WHERE Name = :courseName];
            if (courses.size() == 0) return null;
            apxio__Class__c cls = new apxio__Class__c(
                apxio__Course__c = courses[0].Id,
                Name = courseName
            );
            insert cls;
            return cls.Id;
        }
    
        catch(DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;
        }
    }
    
    public Id classFromCourse(String courseName) {
        try {
            List<apxio__Course__c> courses = [SELECT Id FROM apxio__Course__c WHERE Name = :courseName];
            if (courses.size() == 0) return null;
            apxio__Class__c cls = new apxio__Class__c(
                apxio__Course__c = courses[0].Id,
                Name = courseName
            );
            insert cls;
            return cls.Id;
        }
        catch (DmlException e) {
            System.debug('Error:== ' + e.getMessage());
            return null;   
        }
    }

    void enrollStudents(List<String> emails, String className) {
    try {
    // Get Class Id by Name
    apxio__Class__c cls = [Select Id
                           From apxio__Class__c
                           Where Name = :className];

    // Form list of Students by Email
    List<apxio__Student__c> students = [Select Id
                                       From apxio__Student__c
                                       Where apxio__Email__c IN :emails];

    // Create list to populate enrollments using Class Id and Student Id
    List<apxio__Class_Enrollment__c> enrollList = new List<apxio__Class_Enrollment__c>();

    for (apxio__Student__c student : students) {
        apxio__Class_Enrollment__c enroll = new apxio__Class_Enrollment__c();
        enroll.apxio__Student__c = student.Id;
        enroll.apxio__Offered_Class__c = cls.Id;
        enrollList.add(enroll);
    }

    insert enrollList;
    }

    catch (DmlException e) {
        System.debug('Error:== ' + e.getMessage());
    }
}


}