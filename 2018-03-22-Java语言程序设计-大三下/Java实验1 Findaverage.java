import java.util.*;

// 编译 javac -encoding utf-8  Findaverage.java
// 执行 java Findaverage
// 使用前请将文件名改为Findaverage.java
// Author: 何睿
// 2018-03-23

public class Findaverage
{
    public static void main(String[] args)
    {
        Out out=new Out();
        out.outputaverage();
    }
}

class Out
{
    void outputaverage()
    {
        Scanner keyboard=new Scanner(System.in);
        double average=0;
        System.out.println("输入三个整数以求平均值");
        for (int i=  0;i<3;i++)
        {
            System.out.println("请输入第"+(i+1)+"个数");
            average+=keyboard.nextDouble();
        }
        average=average/3;
        System.out.println("平均数为:"+String.format("%.2f",average));
    }
}