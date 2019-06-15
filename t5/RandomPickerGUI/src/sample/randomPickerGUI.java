package sample;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.io.*;


public class randomPickerGUI extends Application {

    @Override
    public void start(Stage stage){
        // --- Menu File
        MenuBar menuBar = new MenuBar();
        Menu menuFile = new Menu("File");
        Menu menuHelp = new Menu("Help");
        MenuItem itemOpen = new MenuItem("Open");
        MenuItem itemExit = new MenuItem("Exit");
        MenuItem itemAbout =new MenuItem("About");
        menuHelp.getItems().addAll(itemAbout);
        menuFile.getItems().addAll(itemOpen,itemExit);
        menuBar.getMenus().addAll(menuFile, menuHelp);


        //--- Label
        Label labelSort=new Label("");
        Label labelAbout=new Label("Random Picker Gui criado por Gustavo Noll");

        //--- Buttons
        Button buttonShuffle = new Button("Shuffle");
        Button buttonRestart=new Button("Restart");
        Button buttonNext=new Button("Next");
        Button buttonBack=new Button("Back");

        //--- text area
        TextArea textArea = new TextArea();

        // --- BorderInit
        BorderPane borderInit = new BorderPane();
        borderInit.setPrefSize(450,350);
        borderInit.setTop(menuBar);
        borderInit.setBottom(buttonShuffle);
        borderInit.setCenter(textArea);
        borderInit.setTop(menuBar);

        // --- BorderAlignment
        BorderPane.setAlignment(buttonNext,Pos.CENTER);
        BorderPane.setAlignment(buttonRestart,Pos.CENTER);
        BorderPane.setAlignment(buttonShuffle,Pos.CENTER);

        //--- FileController
        FileController arquivoTXT=new FileController();

        // --- setOnActions
        itemOpen.setOnAction(t -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Open Resource File");
            //filter
            FileChooser.ExtensionFilter extFilter = new FileChooser.ExtensionFilter("TXT files (*.txt)", "*.txt");
            fileChooser.getExtensionFilters().add(extFilter);
            File seletedFile;
            if((seletedFile=fileChooser.showOpenDialog(stage))!=null) {
                changeBorderPane(borderInit,buttonShuffle,textArea);
                textArea.clear();
                arquivoTXT.setTxtNames(seletedFile);
                for (int i = 0; i < arquivoTXT.getSize(); i++) {
                    textArea.appendText(arquivoTXT.getTxtNames(i) + "\n");
                }
            }
        });

        itemExit.setOnAction(t -> Platform.exit());

        buttonShuffle.setOnAction(t ->{
            changeBorderPane(borderInit,buttonNext,buttonRestart,labelSort);
            arquivoTXT.setTxtNames(textArea);
            if(arquivoTXT.getSize()<50)
                arquivoTXT.randomOff();
            else arquivoTXT.randomOn();
            labelSort.setText(arquivoTXT.getTxtNames(arquivoTXT.getControlNext()));
            arquivoTXT.incControl();
            if(arquivoTXT.getSize()==1)
                borderInit.setRight(null);
        });

        buttonNext.setOnAction(t->{
            if(arquivoTXT.getSize()-1==arquivoTXT.getControlNext())
                borderInit.setRight(null);
            labelSort.setText(arquivoTXT.getTxtNames(arquivoTXT.getControlNext()));
            arquivoTXT.incControl();
        });

        buttonRestart.setOnAction(t-> {
            changeBorderPane(borderInit,buttonShuffle,textArea);
            textArea.clear();
            arquivoTXT.setControlNext(0);
        });

        itemAbout.setOnAction(t -> changeBorderPane(borderInit,null,buttonBack,labelAbout));

        buttonBack.setOnAction(t-> changeBorderPane(borderInit,buttonShuffle,textArea));


        stage.setTitle("Random Picker GUI");
        Scene sInit = new Scene(borderInit, 500, 400);
        stage.setScene(sInit);
        stage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }

    private void changeBorderPane(BorderPane borderPane, Button button, TextArea textArea){
        borderPane.setBottom(button);
        borderPane.setCenter(textArea);
        borderPane.setLeft(null);
        borderPane.setRight(null);
    }
    private void changeBorderPane(BorderPane borderPane,Button button1,Button button2,Label label){
        borderPane.setRight(button1);
        borderPane.setCenter(label);
        borderPane.setLeft(button2);
        borderPane.setBottom(null);
    }


}
