// 编译 javac -encoding utf-8  BookReview.java
// 执行 java Test
// 使用前请将文件名改为BookReview.java
// Author: 何睿
// if you find any mistake, please contact super76rui@icloud.com
// 2018-04-20

import java.util. * ; 

public class BookReview 
{
    public static void main(String[] args)
    {
        Book A = new Book("my first book");
        int i=0;
        Scanner keyboard= new Scanner(System.in);
        while(i<6)
        {
            System.out.println("第"+(i+1)+"次评级:");
            if (A.addRating(keyboard.nextInt()))
                i=i+1;  
        }
        System.out.println(A.bookName+",Average Rating:"+String.format("%.2f",A.getAverage()));
        keyboard.close();
    }
}

class Book 
{
    String bookName; 
    int NumRated5; 
    int NumRated4; 
    int NumRated3; 
    int NumRated2; 
    int NumRated1; 

    public Book(String nameIn)
    {
        this.bookName = nameIn; 
    }

    boolean addRating(int Rank)
    {
        switch (Rank)
        {
            case 1:NumRated1 = NumRated1 + 1; break; 
            case 2:NumRated2 = NumRated2 + 1; break; 
            case 3:NumRated3 = NumRated3 + 1; break; 
            case 4:NumRated4 = NumRated4 + 1; break; 
            case 5:NumRated5 = NumRated5 + 1; break; 
            default:System.out.println("评级只有1到5，请重新输入"); return false; 
        }
        return true; 
    }
    double getAverage()
    {
        return (5 * NumRated5 + 4 * NumRated4 + 3 * NumRated3 + 2 * NumRated2 + NumRated1)/(NumRated5 + NumRated4 + NumRated3 + NumRated2 + NumRated1);
    }
}
