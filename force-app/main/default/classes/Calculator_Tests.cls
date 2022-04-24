@isTest
private class Calculator_Tests {

    @testSetup
	static void loadTestData(){
	}

    @isTest
    static void testPosAddition() {
		System.assertEquals(3, Calculator.addition(1, 2), '1 + 2 = 3');
    }

    @isTest
    static void testPosSubtraction() {
		System.assertEquals(5, Calculator.subtraction(10, 5), '10 - 5 = 5');
    }

    @isTest
    static void testPosMultiply() {
		System.assertEquals(100, Calculator.multiply(10, 10), '10 x 10 = 100');
    }

    @isTest
    static void testPosDivide() {
		System.assertEquals(25, Calculator.divide(100, 4), '100 / 4 = 25');
    }
    
    @isTest
    static void testNegAddition() {
		System.assertNotEquals(1, Calculator.addition(1, 2), '1 + 2 != 3');
    }

    @isTest
    static void testNegSubtraction() {
		System.assertNotEquals(4, Calculator.subtraction(10, 5), '10 - 5 != 4');
    }

    @isTest
    static void testNegMultiply() {
		System.assertNotEquals(10, Calculator.multiply(10, 10), '10 x 10 != 10');
    }

    @isTest
    static void testNegDivide() {
		System.assertNotEquals(20, Calculator.divide(100, 4), '100 / 4 != 20');
    }    
    
    @isTest
    static void testMultiplyException() {
        List<Boolean> exceptions = new List<Boolean>();
        try {
            Calculator.multiply(0, 10);
            Calculator.multiply(10, 0);
            Calculator.multiply(0, 0);
        } catch (Calculator.CalculatorException ce) {
            if (ce.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')) {
                exceptions.add(true);
            } // end if
        } // end catch
        
        System.assert(exceptions.size() >= 1, 'Exceptions list should have at least 1 exception');
        for (Boolean a : exceptions) {
            System.assert(a, 'Calculator should have thrown an exception');
        }
    }    

    @isTest
    static void testDivideException() {
        List<Boolean> exceptions = new List<Boolean>();
        try {
            Calculator.divide(10, 0);
        } catch (Calculator.CalculatorException ce) {
            if (ce.getMessage().equalsIgnoreCase('you still can\'t divide by zero')) {
                exceptions.add(true);
            } // end if
        } // end catch
        
        System.assert(exceptions.size() >= 1, 'Exceptions list should have at least 1 exception');
        for (Boolean a : exceptions) {
            System.assert(a, 'Calculator should have thrown an exception');
        }
    }    

    @isTest
    static void testDivideException2() {
        List<Boolean> exceptions = new List<Boolean>();
        try {
            Calculator.divide(10, -5);
        } catch (Calculator.CalculatorException ce) {
            if (ce.getMessage().equalsIgnoreCase('Division returned a negative value.-2')) {
                exceptions.add(true);
            } // end if
        } // end catch
        
        System.assert(exceptions.size() >= 1, 'Exceptions list should have at least 1 exception');
        for (Boolean a : exceptions) {
            System.assert(a, 'Calculator should have thrown an exception');
        }
    }     
}