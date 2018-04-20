// 编译 javac -encoding utf-8  StudentTest.java
// 执行 java Test
// 使用前请将文件名改为Student.java
// Author: 何睿
// 2018-04-17

public class StudentTest
{
    public static void main(String[] args)
    {
        Student A = new Student("489999", "何睿", "信管"); 
        A.setTuition(4522); 
        Systems.out.println(A.toString()); 
    }
}

class Student
{
        public String studentNumber; 
        public String studentName; 
        public String specialty; 
        private double tuition; 
        public Student(String stuNumber, String stuNameIn, String specialtyIn)
        {
            this.studentName = stuNameIn; 
            this.studentNumber = stuNumber; 
            this.specialty = specialtyIn; 
        }
        void setTuition(double tuitionIn)
        {
            if (tuitionIn >= 4500.0)
                this.tuition = tuitionIn; 
            else    
                System.out.println("学费应大于等于4500"); 
        }
        double getTuition()
        {
            return tuition; 
        }
        public String toString()
        {
            return ("姓名:" + this.studentName + "\n" + "学号:" + this.studentNumber + "\n" + "专业:" + this.specialty + "\n" + "学费" + this.tuition); 
        }
}