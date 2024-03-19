public with sharing class ApexSandboxLists {
  public ApexSandboxLists() {
  
  }

  public Integer secondLargest(List<Integer> numbers) {
    Integer largestSoFar = -2147483647 - 1;
    Integer secondLargestSoFar = -2147483647 - 1;

    for (Integer i=0;i<numbers.size(); i++) {
        if (numbers[i] < largestSoFar && numbers[i] > secondLargestSoFar) {
            secondLargestSoFar = numbers[i];
        }
        else if (numbers[i] > largestSoFar) {
            secondLargestSoFar = largestSoFar;
            largestSoFar = numbers[i];
        }
    }
    return secondLargestSoFar;
  }

  public boolean isSorted(List<Integer> numbers) {
    if (isAscending(numbers) || isDescending(numbers))
        return true;
    return false;
  }

  public boolean isAscending(List<Integer> numbers) {        
    for(Integer i = 0; i < numbers.size() - 1; i++)
        if (numbers[i] > numbers[i+1])
            return false;
    return true;
  }

  public boolean isDescending(List<Integer> numbers) {        
    for(Integer i = 0; i < numbers.size() - 1; i++)
        if (numbers[i] < numbers[i+1])
            return false;
    return true;
  }


  public List<String> orgNames(List<String> adjectives, List<String> animals) {
    List<String> results = new List<String>();

    for (String adjective : adjectives) {
        for (String animal : animals) {
            results.add(adjective + '-' + animal);
        }
    }

    return results;
  }

  public List<Integer> fibonacciSeries(Integer n) {
    List<Integer> results = new List<Integer>();
    if (n <= 0) {
        return results;
    }

    Integer previous = 0;
    Integer current = 1;

    for (Integer i = 0; i < n; i++) {
        results.add(current);
        Integer next = current + previous;
        previous = current;
        current = next;
    }

    return results;
  }
  
  public List<String> fullNames(List<String> firstNames, List<String> lastNames) {
    List<String> fNames = New List<String>();

    for(Integer i = 0; i < firstNames.size(); i++) {
        fNames.add(firstNames[i] + ' ' + lastNames[i]);
    } 

    return fNames;
  }
  
  public void insertAtStart(String cityName, List<String> cities) {
    if (0 == cities.size()) {
        cities.add(cityName);
    }
    else {
        cities.add(0, cityName);
    }
  }

  public Decimal average(List<Decimal> numbers){
    Decimal divisor = numbers.size();
    Decimal sum = 0;

    for (Decimal num : numbers) {
        sum = sum + num;
    }

    return sum.divide(divisor, 2);
  }

  public Integer maxConsecutiveOnes(Integer[] numbers) {
    Integer currentCount = 0;
    Integer maxCount = 0;
    for (Integer i = 0; i<numbers.size(); i++){
        if (numbers[i] == 1){
            currentCount++;
            if (currentCount > maxCount) {
                maxCount = currentCount;
            }
        }
        else if (numbers[i] == 0){
            currentCount = 0;
        }
    }
    return maxCount;
  }

  public List<String> getNamesInAscOrder(List<String> accountNames) {
    accountNames?.sort();
    return accountNames;
  }

  public static Integer arraySum(List<Integer> numbers) {
    Integer sum = 0;

    for (Integer n : numbers) {
      // sum += n;
      sum = sum + n;
    }

    return sum;
  }

  public Integer findTargetCount(List<Integer> nums, Integer target) {
    Integer count = 0;

    for (Integer num : nums) {
        if (target == num) {
            count++;
        }
    }

    return count;
  }

  public static Integer findLast(List<Integer> nums, Integer target) {
    Integer index = -1;

    for (Integer i = 0; i < nums.size(); i++) {
        if (target == nums[i]) {
            index = i;
        }
    }

    if (index == -1) {
        return -1;
    }
    else {
        return index;
    }
  }

  public List<Integer> evenNumbers(Integer n) {
    List<Integer> results = new List<Integer>();

    for (Integer i = 1; i <= n; i++){
        results.add(i * 2);
    }

    return results;
  }

  public static Integer findLargest(List<Integer> nums) {
    Integer largest = nums[0];
  
      for (Integer i = 0; i < nums.size(); i++) {
          if (nums[i] > largest) {
              largest = nums[i];
          }
      } 
  
      return largest;
  }

  public List<Integer> positiveIntegers(List<Integer> numbers) {
    List<Integer> positives = new List<Integer>();

    for (Integer posInt : numbers) {
        if (posInt > 0) {
            positives.add(posInt);
        }
    }

    return positives;
  }


}