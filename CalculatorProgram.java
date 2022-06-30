import java.util.Scanner;

public class CalculatorProgram {
	  public static void main(String[] args) {

	    int c;
	    int number1;
		int number2;
		int result;

	    // create an object of Scanner class
//	    Scanner s = new Scanner(System.in);

	    // ask users to enter operator
	    System.out.println("Actions: 1.add, 2.sub, 3.multiply, or 4.divide");
//	    c = s.nextInt();

	    // ask users to enter numbers
	    /*System.out.println("Enter first number");
	    number1 = input.nextDouble();

	    System.out.println("Enter second number");
	    number2 = input.nextDouble();*/
	    
	    number1=12;
	    number2=8;

	      // performs addition between numbers
	        result = number1 + number2;
	        System.out.println(number1 + " + " + number2 + " = " + result);

	      // performs subtraction between numbers
	        result = number1 - number2;
	        System.out.println(number1 + " - " + number2 + " = " + result);
	   

	      // performs multiplication between numbers
	
	        result = number1 * number2;
	        System.out.println(number1 + " * " + number2 + " = " + result);
	        

	      // performs division between numbers
	      
	        result = number1 / number2;
	        System.out.println(number1 + " / " + number2 + " = " + result);
	       

	      
	        System.out.println("Done sucesfully!");
	      
	    }

	  }
