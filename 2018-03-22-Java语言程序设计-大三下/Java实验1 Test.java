import java.util.*;

// 编译 javac -encoding utf-8  Test.java
// 执行 java Test
// 使用前请将文件名改为Test.java
// Author: 何睿
// 2018-03-23

public class Test
{
    public static void main(String[] args) {
        BMI();
    }
    static void BMI()
    {
        double bmi;
        double weigth;
        double high;
        Scanner keyboard=new Scanner(System.in);
        System.out.println("输入你的体重(公斤):");
        weigth=keyboard.nextDouble();
        System.out.println("输入身高(米)");
        high=keyboard.nextDouble();
        bmi=weigth/(high*high);
        System.out.println("你的BMI为:"+String.format("%.2f",bmi));
        if(bmi>=35) System.out.println("你高度肥胖");
        else if (bmi>=30 && bmi <=34.9) System.out.println("你超重");
        else if (bmi>25 && bmi<29.9) System.out.println("你偏重");
        else if (bmi>=18.5 && bmi<24.9) System.out.println("你正常");
        else System.out.println("你偏轻");

    }
}
