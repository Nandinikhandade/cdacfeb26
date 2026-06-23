package Encapsulation;

class BankAccount {
	private int balance;

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

}

public class BankAccountMain {
	public static void main(String[] args) {
		BankAccount b = new BankAccount();
		b.setBalance(10000);
		System.out.println("balance : " + b.getBalance());

	}

}
