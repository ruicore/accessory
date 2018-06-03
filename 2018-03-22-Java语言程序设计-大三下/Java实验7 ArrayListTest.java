import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class ArrayListTest
{
    @SuppressWarnings("finally")
    public static void main (String[] args)
    {
        Scanner keyboard = new Scanner(System.in);
        List<Double> scoreList = new ArrayList<>();
        double score = 0.0;

        System.out.println("请输入分数，以空格隔开");
        while(score>=0.0)
        {
            try
            {
                score = keyboard.nextDouble();
                scoreList.add(score);
            }
            catch (Exception e)
            {
                e.printStackTrace();
                System.out.println("请按要求输入数据");
                score=-1;
            }
        }
        double average= 0;
        for (int j=0;j<scoreList.size();j++)
        {
            average+=scoreList.get(j);
        }
        System.out.println("平均分数为"+String.format("%.2f",average/scoreList.size()));
        keyboard.close();
    }
}