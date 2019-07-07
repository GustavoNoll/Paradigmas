import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import java.io.*;

//t6 com barchart
public class GitHubAnalyzerGUI extends Application {

    private final TableView<DataEntry> table= new TableView<>();

    @Override
    public void start(Stage stage) throws IOException {

        MenuBar menuBar = new MenuBar();
        Menu menuFile = new Menu("File");
        Menu menuTools=new Menu("Tools");
        Menu menuHelp = new Menu("Help");
        MenuItem itemOpen = new MenuItem("Open");
        MenuItem itemExit = new MenuItem("Exit");
        MenuItem itemCommit=new MenuItem("Commit Analyzer");
        MenuItem itemAbout =new MenuItem("About");
        menuHelp.getItems().addAll(itemAbout);
        menuFile.getItems().addAll(itemOpen,itemExit);
        menuTools.getItems().add(itemCommit);
        menuBar.getMenus().addAll(menuFile, menuTools,menuHelp);
        FileController arquivoGit=new FileController();
        table.setItems(arquivoGit.data);
        table.setEditable(true);
        tableStart();


        // --- setOnActions
        itemOpen.setOnAction(t -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Open Resource File");
            //filter
            FileChooser.ExtensionFilter extFilter = new FileChooser.ExtensionFilter("TXT files (*.txt)", "*.txt");
            fileChooser.getExtensionFilters().add(extFilter);
            File seletedFile;
            if((seletedFile=fileChooser.showOpenDialog(stage))!=null) {
                arquivoGit.clearAll();
                arquivoGit.setUrlRepositories(seletedFile);
            }
        });
        itemCommit.setOnAction(t->{
            arquivoGit.committerAll();
            arquivoGit.repositorioToDataEntry();
        });


        itemExit.setOnAction(t -> Platform.exit());

        VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(10, 10, 10, 10));
        vbox.getChildren().addAll(menuBar,table);
        stage.setTitle("GitHub Analyzer GUI");
        stage.setScene(new Scene(vbox,1000,700));
        stage.show();

    }


    public static void main(String[] args) {
        launch(args);
    }

    private void tableStart(){
        TableColumn urlCol = new TableColumn("Repositorio");
        TableColumn dataCol = new TableColumn("Data");
        TableColumn mensagemCol = new TableColumn("Media de tamanho de mensagem");
        TableColumn numeroCol=new TableColumn("Numero de commits");

        urlCol.setCellValueFactory(new PropertyValueFactory<>("url"));
        mensagemCol.setCellValueFactory(new PropertyValueFactory<>("mensagemCommit"));
        numeroCol.setCellValueFactory(new PropertyValueFactory<>("numeroCommit"));
        table.getColumns().addAll(urlCol,mensagemCol,numeroCol);
        table.setMinHeight(600);
    }

}
