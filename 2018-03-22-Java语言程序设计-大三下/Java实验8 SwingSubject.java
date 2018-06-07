import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import javafx.scene.layout.Border;

public class SwingSubject
{
    public static void main (String[] args)
    {
        Base base = new Base();
        base.CreatJFrame("Subject");
    }
}

class Base extends JFrame
{
    private static final long serialVersionUID = -7945004261284306797L;
	//某个神秘码，不声明会触发本JAVA编译器的警报机制
    public void CreatJFrame(String title)
    {
        JFrame jf = new JFrame(title);
        Container container= jf.getContentPane();
        JButton jb = new JButton("Which Lesson?");
        JLabel jl = new JLabel("Java Programming!",SwingConstants.CENTER);
        container.add(BorderLayout.NORTH,jb);
        jf.add(BorderLayout.CENTER,jl);
        jf.setVisible(true);
        jl.setVisible(false);
        jf.setSize(800,450);
        jf.setDefaultCloseOperation(EXIT_ON_CLOSE);

        jb.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                jl.setVisible(true);
            }
        });
    }
}