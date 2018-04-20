// 编译 javac -encoding utf-8  EmployeeTest.java
// 执行 java Test
// 使用前请将文件名改为 EmployeeTest.java
// Author: 何睿
// if you find any mistake, please contact super76rui@icloud.com
// 2018-04-20

import java.util. * ; 

public class EmployeeTest
{
    public static void main(String[] args)
    {
        Employee[] employeeList = new Employee[4]; 
        double sales = 100000 + Math.random() * 50000; 
        Scanner keyboard = new Scanner(System.in); 
        String nameInput; 
        String numberInput; 
        System.out.println("本月的营业额随机值为：" + String.format("%.4f", sales) + "元人民币\n请完善员工信息法工资！"); 
        for (int i = 0; i < 4; i ++ )
        {
            switch (i)
            {
                case 0:System.out.println("请完善销售经理的编号"); break; 
                case 1:System.out.println("请完善第一名专职销售员的编号:"); break; 
                case 2:System.out.println("请完善第二名专职销售员的编号:"); break; 
                case 3:System.out.println("请完善兼职促销员的编号:"); break; 
            }
            numberInput = keyboard.next(); 
            for (int j = 0; j < i; j ++ )
            {
                if (numberInput.equals(employeeList[j].employeeNumber))
                    numberInput = "false"; 
            }
            if (numberInput.equals("false"))
            {
                System.out.println("此编号与前面录入的员工编号冲突，请重新输入员工信息"); 
                i = i-1; 
                continue; 
            }
            switch (i)
            {
                case 0:System.out.println("请完善销售经理的姓名"); break; 
                case 1:System.out.println("请完善第一名专职销售员的姓名:"); break; 
                case 2:System.out.println("请完善第二名专职销售员的姓名:"); break; 
                case 3:System.out.println("请完善兼职促销员的姓名:"); break; 
            }
            nameInput = keyboard.next(); 
            switch (i)
            {
                case 0:employeeList[0] = new SalesManager(nameInput, numberInput); break; 
                case 1:employeeList[1] = new ProfessionalSalesMan(nameInput, numberInput); break; 
                case 2:employeeList[2] = new ProfessionalSalesMan(nameInput, numberInput); break; 
                case 3:employeeList[3] = new AmateurSalesMan(nameInput, numberInput); break; 
            }
            System.out.println("录入成功！"); 
        }
        for (int i = 0; i < 4; i ++ )
        {
			employeeList[i].payoffCalculate(sales); 
			System.out.println(employeeList[i].toString()); 
        }
        keyboard.close();
    }
}

abstract class Employee
{
    String employeeName; 
    String employeeNumber; 
    public Employee(String nameIn, String numberIn)
    {
        this.employeeName = nameIn; 
        this.employeeNumber = numberIn; 
    }
    abstract void payoffCalculate(double Sales); 
}

class SalesManager extends Employee
{
    private double payoff; 
    public SalesManager (String nameIn, String numberIn)
    {
        super(nameIn, numberIn); 
    }
    void payoffCalculate(double Sales)
    {
        this.payoff = 5000 + Sales * 0.01; 
    }
    public String toString()
    {
        return ("职位：销售经理\n" + "员工编号：" + this.employeeNumber + "\n员工姓名：" + this.employeeName + "\n员工薪水（每月）：" + String.format("%.2f", this.payoff)); 
    }
    
}

class ProfessionalSalesMan extends Employee
{
    private double payoff; 
    public ProfessionalSalesMan (String nameIn, String numberIn)
    {
        super(nameIn, numberIn); 
    }
    void payoffCalculate(double Sales)
    {
        this.payoff = 3000 + Sales * 0.05; 
    }
    public String toString()
    {
        return ("职位：专职销售员\n" + "员工编号：" + this.employeeNumber + "\n员工姓名：" + this.employeeName + "\n员工薪水（每月）：" + String.format("%.2f", this.payoff)); 
    }
}

class AmateurSalesMan extends Employee
{
    private double payoff; 
    public AmateurSalesMan(String nameIn, String numberIn)
    {
        super(nameIn, numberIn); 
    }
    void payoffCalculate(double Sales)
    {
        this.payoff = 50 * 24 + Sales * 0.00; 
    }
    public String toString()
    {
        return ("职位：兼职销售员\n" + "员工编号：" + this.employeeNumber + "\n员工姓名：" + this.employeeName + "\n员工薪水（每天）：" + String.format("%.2f", this.payoff)); 
    }
}