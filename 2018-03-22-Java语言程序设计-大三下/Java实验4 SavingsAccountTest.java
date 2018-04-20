// 编译 javac -encoding utf-8  SavingsAccountTest.java
// 执行 java Test
// 使用前请将文件名改为 SavingsAccountTest.java
// Author: 何睿
// if you find any mistake, please contact super76rui@icloud.com
// 2018-04-20

import java.util. * ; 

public class SavingsAccountTest
{
    public static void main(String[] args)
    {
        SavingsAccount savingsAccount = new SavingsAccount("95522", 5000, 0.4); 
        System.out.println(savingsAccount.toString()); 
    }
}

class BankAccount
{
    public String accountNumber; 
    public double balance; 
    public BankAccount(String accoutNumberIn, double balanceIn)
    {
        this.accountNumber = accoutNumberIn; 
        this.balance = balanceIn; 
    }
}

class SavingsAccount extends BankAccount
{
    private double interestRate; 
    public SavingsAccount(String accountNumberIn, double balanceIn, double interestRateIn)
    {
        super (accountNumberIn, balanceIn); 
        this.interestRate = interestRateIn; 
    }
    public String toString()
    {
        return ("账号:" + this.accountNumber + "\n余额:" + this.balance + "\n利率:" + this.interestRate); 
    }
}