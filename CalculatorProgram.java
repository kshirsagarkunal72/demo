import java.util.Scanner;

public class CalculatorProgram {
	  public static void main(String[] args) {

	    int c;
	    int number1;
		int number2;
		int result;

	    // create an object of Scanner class
	    Scanner s = new Scanner(System.in);

	    // ask users to enter operator
	    System.out.println("Choose an operator: 1.add, 2.sub, 3.multiply, or 4.divide");
	    c = s.nextInt();

	    // ask users to enter numbers
	    /*System.out.println("Enter first number");
	    number1 = input.nextDouble();

	    System.out.println("Enter second number");
	    number2 = input.nextDouble();*/
	    
	    number1=12;
	    number2=8;

	    switch (c) {

	      // performs addition between numbers
	      case 1:
	        result = number1 + number2;
	        System.out.println(number1 + " + " + number2 + " = " + result);
	        break;

	      // performs subtraction between numbers
	      case 2:
	        result = number1 - number2;
	        System.out.println(number1 + " - " + number2 + " = " + result);
	        break;

	      // performs multiplication between numbers
	      case 3:
	        result = number1 * number2;
	        System.out.println(number1 + " * " + number2 + " = " + result);
	        break;

	      // performs division between numbers
	      case 4:
	        result = number1 / number2;
	        System.out.println(number1 + " / " + number2 + " = " + result);
	        break;

	      default:
	        System.out.println("Invalid operator!");
	        break;
	    }

	    s.close();
	  }
	}
