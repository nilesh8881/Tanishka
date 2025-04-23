public with sharing class Calculator123 {
    
        // Add two numbers
        public static Integer add(Integer a, Integer b) {
            return a + b;
        }
    
        // Subtract two numbers
        public static Integer subtract(Integer a, Integer b) {
            return a - b;
        }
    
        // Multiply two numbers
        public static Integer multiply(Integer a, Integer b) {
            return a * b;
        }
    
        // Divide two numbers with basic error handling
        public static Decimal divide(Decimal a, Decimal b) {
            if (b == 0) {
                throw new ArithmeticException('Cannot divide by zero');
            }
            return a / b;
        }    
}