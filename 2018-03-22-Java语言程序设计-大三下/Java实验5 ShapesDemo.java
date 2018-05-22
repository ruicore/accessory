
import java.util.*;
public class ShapesDemo 
{
    public static void main(String[] args)
    {
        // TODO Generate method automatically
        Shape[] shapes = {new Triangle(1),new Hexagon(2.5),new Ellipse(5,3.2)};
        for (Shape item: shapes)
        {
            System.out.println(item.toString());
        }
    }}

interface Shape
{
    public String toString();
    // This method is to output Name, area, perimeter
    public double Calculate_Area(double a,double b);
    public double Calculate_Perimeter(double a,double b);
    // Special Description: when the abstract method is defined,
    // the number of parameters should be as large as possible to satisfy the elliptical class with a slightly complicated circumference area.
    //For a regular triangle and regular hexagon with only one parameter, no parameter B can be used.
}
class Triangle implements Shape
{
    private double length;
    public Triangle (double lengthIn)
    {
        length=lengthIn;
        System.out.println("equilateral triangle's border length is initialized by "+length);
    }
    public String toString()
    {
        return ("equilateral triangle,the area and perimeters is:"+String.format("%.2f",Calculate_Area(length,0.1))+","+String.format("%.2f",Calculate_Perimeter(length,0.1)));
    }
    public double getLength()
    {
        return length;
    }
    public double Calculate_Area(double length, double b)
    {
        return (length*length*Math.sqrt(3)/4);
    }
    public double Calculate_Perimeter(double length,double b)
    {
        return (3*length);
    }
}
class Hexagon implements Shape
{
    private double length;
    public Hexagon (double lengthIn)
    {
        length = lengthIn;
        System.out.println("regular hexagon's border length is initialized by "+length);
    }
    public String toString()
    {
        return ("regular hexagon,the area and perimeters is:"+String.format("%.2f",Calculate_Area(length,0.1))+","+String.format("%.2f",Calculate_Perimeter(length,0.1)));
    }
    public double getLength()
    {
        return length;
    }
    public double Calculate_Area(double length,double b)
    {
        return (length*length * Math.sqrt(3)/4*6);
    }
    public double Calculate_Perimeter(double length,double b)
    {
        return (6*length);
    }
}
class Ellipse implements Shape
{
    private double Half_LongLength;
    private double Half_ShortLength;
    
    public Ellipse (double Half_LongLengthIn, double Half_ShortLengthIn)
    {
        Half_LongLength=Half_LongLengthIn;
        Half_ShortLength=Half_ShortLengthIn;
        System.out.println("Ellipse's Half_LongLength length is initialized by "+Half_LongLength);
        System.out.println("Ellipse's Half_ShortLength length is initialized by "+Half_ShortLength);
    }
    public String toString()
    {
         return ("Ellipse,the area and perimeters is:"+String.format("%.2f",Calculate_Area(Half_LongLength,Half_ShortLength))+","+String.format("%.2f",Calculate_Perimeter(Half_LongLength,Half_ShortLength)));
    }
    public double getLong()
    {
        return Half_LongLength;
    }
    public double getShort()
    {
        return Half_ShortLength;
    }
    public double Calculate_Area(double LongLength,double ShortLength)
    {
        return (2*Math.PI*ShortLength+4*(LongLength-ShortLength));
    }
    public double Calculate_Perimeter(double LongLength,double ShortLength)
    {
        return (Math.PI * LongLength * ShortLength);
    }
}