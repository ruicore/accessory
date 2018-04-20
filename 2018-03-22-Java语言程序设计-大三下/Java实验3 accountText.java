// 编译 javac -encoding utf-8  accountText.java
// 执行 java Test
// 使用前请将文件名改为Student.java
// Author: 何睿
// 2018-04-17

import java.util. * ; 



public class accountText
{
    static Account[] accounts = new Account[5]; 
    static Scanner keyboard = new Scanner (System.in); 

    public static void main(String[] args)
    {
        accounts[0] = new Account("0121503", "name_one"); 
        accounts[1] = new Account("0121504", "name_two"); 
        accounts[2] = new Account("0121505", "name_three"); 
        accounts[3] = new Account("0121506", "name_four"); 
        accounts[4] = new Account("0121507", "name_five"); 
        boolean rightNumberInput = false; 
        boolean rightdepositInput = false; 
        boolean tryagain = false; 
        String accountNumberInput = ""; 
        double balanceReset = 0.0; 
        String inputYes; 
        String againYes; 

        while ( ! tryagain)
        {
            while ( ! rightNumberInput)
            {
                System.out.println("请输入储蓄账号编号"); 
                accountNumberInput = keyboard.next(); 
                for (Account item:accounts)
                {
                    if (accountNumberInput.equals(item.getAccountNumber()))
                    {
                        rightNumberInput = true; 
                    }
                }
                if ( ! rightNumberInput)
                {
                    System.out.println("找不到这个储蓄账户，是否重新输入(Y/N)"); 
                    inputYes = keyboard.next(); 
                    if (inputYes.equals("Y") || inputYes.equals("y"))
                        rightNumberInput =false; 
                    else
                        
                    {
                        System.out.println("程序退出，感谢使用");
                        return;
                    }
                        
                }
            }
            while ( ! rightdepositInput)
            {
                System.out.println("您输入的账号:" + accountNumberInput + "匹配正确，请更新你的存款（输入金额数字）:"); 
                if (keyboard.hasNextDouble())
                {
                    balanceReset = keyboard.nextDouble(); 
                }
                else
                {
                    System.out.println("请不要输入数字和小数点已改的文字符号!操作终止"); 
                    String a = keyboard.next(); 
                    rightdepositInput = true; 
                    continue; 
                }
                if (balanceReset > 0.0)
                {
                    for (Account item:accounts)
                    {
                        if (item.getAccountNumber().equals(accountNumberInput))
                        {
                            item.setBalance(balanceReset); 
                            System.out.println("存款更新成功！\n" + item.toString()); 
                         rightdepositInput = true; 
                        }
                    }
                }
                else
                {
                    System.out.println("请输入一个大于零的攒款余额！"); 
                }
            }
            System.out.println("是否要继续存款？(Y/N)"); 
            againYes = keyboard.next();
            if (againYes.equals("Y") || againYes.equals("y"))
            {
                tryagain = false; 
                rightNumberInput = false; 
                rightdepositInput = false; 
            }
            else
            {
                System.out.println("程序退出，感谢使用"); 
                tryagain = true; 
            }
        }
    }
}

class Account
{
    private String accountNumber; 
    private String accountName; 
    private double balance; 

    public boolean setBalance(double balanceIn)
    {
        if (balanceIn > 0)
        {
            balance = balanceIn; 
            return true; 
        }
        else
        {
            return false; 
        }
    }

    public Account(String numberIn, String nameIn)
    
    {
        this.accountNumber = numberIn; 
        this.accountName = nameIn; 
    }

    public String getAccountNumber()
    {
        return accountNumber; 
    }

    public String getAccountName()
    {
        return accountName; 
    }

    public double getBalance()
    {
        return balance; 
    }
    public String toString()
    {
        return "账号:" + this.accountNumber + "\n姓名:" + this.accountName + "\n余额:" + this.balance; 
    }

}
