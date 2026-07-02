package oops;

class Calculator{
	int a=10;
	int b=20;
	void Addition() {
		System.out.println("Addition is "+(a+b));
	}
	void Subtraction() {
		System.out.println("Subtraction is "+(a-b));
	}
	void Multiplication() {
		System.out.println("Multiplication is "+(a*b));
	}
	void Division() {
		System.out.println("Division is "+(a/b));
	}
	
}
public class CalculatorMain {
public static void main(String[] args) {
	Calculator c=new Calculator();
	c.Addition();
	c.Subtraction();
	c.Multiplication();
	c.Division();
}
}
