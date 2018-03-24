import java.util.*;
import java.lang.reflect.Array;
import java.text.NumberFormat;

// 编译 javac -encoding utf-8  score.java
// 执行 java Test
// 使用前请将文件名改为score.java
// Author: 何睿
// 2018-03-23

public class score
{
    static ArrayList<Integer> score =new ArrayList<>();
    static int inputscore;
    static Scanner keyboard = new Scanner(System.in);
    public static void main(String[] args) {
        inputscore();
        outputscore();
    }
    static void inputscore()
    {
        String yesorno=new String();
        System.out.println("请输入学生成绩");
        inputscore = keyboard.nextInt();
        score.add(inputscore);
        System.out.println("还要录入吗?(Y/N)");
        yesorno = keyboard.next();
        if (yesorno.equals("Y")|| yesorno.equals("y"))
        {
            inputscore();
        }
    }
    static void outputscore()
    {
        double average=0;
        int highest;
        int thelast;
        int total;
        int excelent=0;
        int good=0;
        int middle=0;
        int passed=0;
        int failed=0;
        NumberFormat nt= NumberFormat.getPercentInstance();
        nt.setMinimumFractionDigits(2);
        total=score.size();
        highest=score.get(0);
        thelast=score.get(0);

        for (int i=0;i<total;i++)
        {
            if(score.get(i)>highest)
            {
                highest=score.get(i);
            }
            if(score.get(i)<thelast)
            {
                thelast=score.get(i);
            }
            average+=score.get(i);
        }
        average=average/total;
        for(int j=0;j<total;j++)
        {
            if(score.get(j)<=100 && score.get(j)>=90)
            {
                excelent+=1;
            }
            else if (score.get(j)>=80 && score.get(j)<=89)
            {
                good+=1;
            }
            else if (score.get(j)>=70&& score.get(j)<=79)
            {
                middle+=1;
            }
            else if (score.get(j)>=60 && score.get(j)<=69)
            {
                passed+=1;
            }
            else{
                failed+=1;
            }
        }
        System.out.println("考试总人数为:"+total);
        System.out.println("最高分为："+highest);
        System.out.println("最低分为："+thelast);
        System.out.println("平均分为:"+String.format("%.2f",average));
        System.out.println("优秀人数为:"+excelent+"占总人数百分比："+nt.format((double)excelent/total));
        System.out.println("良好人数为："+good+"占总人数百分比:"+nt.format((double)middle/total));
        System.out.println("中级人数为:"+middle+"占总人数百分比"+nt.format((double)middle/total));
        System.out.println("刚好及格人数为:"+passed+"占总人数百分比"+nt.format((double)passed/total));
        System.out.println("不及格人数为:"+failed+"占总人数百分比"+nt.format((double)failed/total));
        
    }
}
