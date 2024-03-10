public with sharing class ApexSandbox {
    public ApexSandbox() {

    }

    public Boolean isTeenager(Integer age) {
        System.debug(age);
        if (13 <= age && age <= 19) {
            return true;
        }
        else {
            return false;
        }
    }
    public Integer diff(Integer a, Integer b) {
        return (Math.abs(a - b));
    }

    public Boolean sumEquals(Integer a, Integer b, Integer c) {
        return (a + b == c);
    }

    public Boolean ascendingOrder(Integer a, Integer b, Integer c) {
        if ((c >= b) && (b >= a)) {
            return true;
        }
        else {
            return false;
        }
    }

    public String aOrAn(String word) {
        if (word.startsWithIgnoreCase('a')) {
            return 'an ' + word;
        }
        else if (word.startsWithIgnoreCase('e')) {
            return 'an ' + word;
        }
        else if (word.startsWithIgnoreCase('i')) {
            return 'an ' + word;
        }
        else if (word.startsWithIgnoreCase('o')) {
            return 'an ' + word;
        }
        else if (word.startsWithIgnoreCase('u')) {
            return 'an ' + word;
        }
        else {
            return 'a ' + word;
        }
    }

    public static Integer findLargest(Integer num1, Integer num2, Integer num3) {
        Integer largest = num1; // Assume num1 is the largest initially
    
        // Compare num2 with current largest
        if (num2 > largest) {
            largest = num2;
        }
    
        // Compare num3 with current largest
        if (num3 > largest) {
            largest = num3;
        }
    
        return largest;
    }

    Boolean isPassed(Boolean passedExam, Boolean passedAssignments, Boolean passedProject){
        Integer count = 0;
        List<Boolean> boolList = new List<Boolean>();
        boolList.add(passedExam);
        boolList.add(passedAssignments);
        boolList.add(passedProject);
        
        for (Boolean bool : boolList) {
            if (bool == true) {
                count++;
            }
        }
        if (count >= 2) {
            return true;
        }
        else {
            return false;
        }
    }
    
    public Boolean isEndWithZero(Integer num){
        String s1 = num.format();
        return (s1.endsWith('0'));
   }

   public String whichTwo(Integer a, Integer b, Integer c) {
    if(a + b == c) {
        return 'c';
    }
    else if (a + c == b) {
        return 'b';
    }
    else if (b + c == a) {
        return 'a';
    }
    else {
        return '';
    }
    }

    public String evenOrOdd(Integer num) {
        Integer remains = Math.mod(num, 2);
        if (0 == remains) {
            return 'even';
        }
        else {
            return 'odd';
        }
    }

    public Integer rockPaperScissors(String player1, String player2) {
        if (('rock' == player1 && 'scissors' == player2) || ('scissors' == player1 && 'paper' == player2) || ('paper' == player1 && 'rock' == player2)){
            return 1;
        }
        else if (player1 == player2) {
            return 0;
        }
        else {
            return 2;
        }
    }

    public String ageGroup(Integer n) {
        if (0 == n || 1 == n) {
            return 'Infant';
        }
        else if (2 <= n && n <= 14) {
            return 'Child';
        }
        else if (15 <= n && n <= 21) {
            return 'Youth';
        }
        else {
            return 'Adult';
        }
    }

    public Boolean companionPlants(String plant1, String plant2) {
        if ('onions' == plant1) {
            if ('lettuce' == plant2 || 'carrots' == plant2 || 'tomatoes' == plant2) {
                return true;
            }
            else {
                return false;
            }
        } 
        else if ('lettuce' == plant1) {
            if ('cucumbers' == plant2 || 'onions' == plant2) {
                return true;
            }
            else {
                return false;
            }
        } 
        else if ('cucumbers' == plant1) {
            if ('lettuce' == plant2) {
                return true;
            }
            else {
                return false;
            }
        } 
        else if ('carrots' == plant1 && 'onions' == plant2) {
            return true;
        } 
        else if ('tomatoes' == plant1 && 'onions' == plant2) {
            return true;
        } 
        else {
            return false;
        }
    }

    public Boolean isLeapYear(Integer year) {
        if (Math.mod(year, 4) == 0) {
            if (Math.mod(year, 100) == 0) {
                if (Math.mod(year, 400) == 0) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    public Boolean isPrime(Integer num) {
        if (num <= 1) {
            return false;
        }
        if (num == 2) {
            return true;
        }
        if (Math.mod(num, 2) == 0) {
            return false; // Even numbers other than 2 are not prime
        }

        // Check divisibility starting from 3 up to the square root of num
        for (Integer i = 3; i <= Math.sqrt(num); i += 2) {
            if (Math.mod(num, i) == 0) {
                return false; // Found a divisor, so not a prime number
            }
        }
        return true; // No divisors found, so it's a prime number
    }


}

