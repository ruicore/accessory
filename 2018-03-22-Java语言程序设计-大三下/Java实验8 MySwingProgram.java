import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class MySwingProgram
{
    public static void main(String[] args)
    {
        new Base2().CreateJFrame("My first Swing Program");
    }
}

class Base2 extends JFrame
{
    private static final long serialVersionUID = 4761583961790092691L;
	//某个神秘码，不声明会触发本JAVA编译器的警报机制
    public void CreateJFrame(String title)
    {
        JFrame jf = new JFrame(title);
        Container container = jf.getContentPane();
        container.setLayout(new GridLayout(3,3,10,10));
        JButton jbOk=new JButton("OK");
        JButton jbCancel= new JButton("Cancel");
        JLabel jl = new JLabel("");

        JPanel jp= new JPanel(new GridLayout(1,3,10,10));
        jp.add(jbOk);
        jp.add(jbCancel);

        container.add(new JLabel(""));
        container.add(new JLabel(""));
        container.add(new JLabel(""));
        container.add(new JLabel(""));
        container.add(jp);
        container.add(new JLabel(""));
        container.add(new JLabel(""));
        container.add(jl);
        container.add(new JLabel(""));
        //在容器的九个格子布局里填充，使得最后两个按钮能产生放在中间的效果
        jf.setVisible(true);

        //jl.setVisible(false);
        jf.setSize(800,450);
        jf.setDefaultCloseOperation(EXIT_ON_CLOSE);
        jbOk.addActionListener(new ActionListener(){
        
            @Override
            public void actionPerformed(ActionEvent e) {
                jl.setText("Welcome to my first Swing Program!");
            }
        });
        jbCancel.addActionListener(new ActionListener(){
        
            @Override
            public void actionPerformed(ActionEvent e) {
                jf.dispose();
            }
        });
    }
}