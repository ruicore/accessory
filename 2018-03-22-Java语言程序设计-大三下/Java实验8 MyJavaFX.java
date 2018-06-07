import javafx.application.*;
import javafx.stage.*;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.event.*;
import javafx.geometry.*;

@SuppressWarnings("restriction")
//如果不做此声明，会触发JAVA的警报机制
//要想解决这个问题，先在配置界面修改相关的设置

public class MyJavaFX extends Application
{
    Label response;

    public void start(Stage myStage)
    {
        myStage.setTitle("MyJavaFXProgram");
        FlowPane rootNode = new FlowPane(10,10);
        rootNode.setAlignment(Pos.CENTER);
        Scene myScene = new Scene(rootNode,800,450);
        
        //16:9
        myStage.setScene(myScene);
        response = new Label("");
        Button OK = new Button("OK");
        Button Cancel = new Button("Cancel");

        OK.setOnAction(new EventHandler<ActionEvent>(){
        
            @Override
            public void handle(ActionEvent event) {
                response.setText("Welcome to my Java FX Program!");
            }
        });

        Cancel.setOnAction(new EventHandler<ActionEvent>(){
        
            @Override
            public void handle(ActionEvent event) {
                myStage.close();
            }
        });

        rootNode.getChildren().add(OK);
        rootNode.getChildren().add(Cancel);
        rootNode.getChildren().add(response);
        
        myStage.show();
    }
}