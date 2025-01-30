import java.util.Scanner;

/**
 * This Java program demonstrates a simple calculation: 
 * finding the sum of two numbers entered by the user.
*/
/*
 hello
 gghh
 */

public class SumOfTwoNumbers {

    public static void main(String[] args) {

        // Create a Scanner object to read user input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the first number
        System.out.print("Enter the first number: ");
        int num1 = scanner.nextInt();

        // Prompt the user to enter the second number
        System.out.print("Enter the second number: ");
        int num2 = scanner.nextInt();

        // Calculate the sum of the two numbers
        int sum = num1 + num2;

        // Display the result
        System.out.println("The sum of " + num1 + " and " + num2 + " is: " + sum);

        // Close the scanner to release resources
        scanner.close();
    }
}