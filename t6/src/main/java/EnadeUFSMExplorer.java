import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Modality;
import javafx.stage.Stage;
import java.io.*;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;


//t6 com barchart
public class EnadeUFSMExplorer extends Application {

    private final TableView<DataEntry> table= new TableView<>();

    @Override
    public void start(Stage stage) {


        // --- Menu File
        MenuBar menuBar = new MenuBar();
        Menu menuFile = new Menu("File");
        Menu menuHelp = new Menu("Help");
        MenuItem itemSource = new MenuItem("Source");
        MenuItem itemReload = new MenuItem("Reload");
        MenuItem itemExit = new MenuItem("Exit");
        MenuItem itemAbout =new MenuItem("About");
        menuHelp.getItems().addAll(itemAbout);
        menuFile.getItems().addAll(itemSource,itemReload,itemExit);
        menuBar.getMenus().addAll(menuFile, menuHelp);

        table.setEditable(true);
        tableStart();
        OpenCSVReader csvFile=new OpenCSVReader();
        Alert alert=new Alert(Alert.AlertType.NONE);
        try {
            csvFile.CSVReader();
        } catch (IOException e) {
            alert.setAlertType(Alert.AlertType.ERROR);
            alert.setContentText("Erro na leitura/falha na conexao");
        }
        table.setItems(csvFile.data);


        //linha selecionada
        table.getSelectionModel().selectedItemProperty().addListener((obs, oldSel, newSel) -> {
            DataEntry selectedItem = table.getSelectionModel().getSelectedItem();

            HBox secondaryHBox = new HBox();
            Alert imageAlert=new Alert(Alert.AlertType.NONE);

            //image
            ImageThread imgT=new ImageThread(selectedItem.getImagem());
            imgT.start();
            try {
                imgT.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if(imgT.falha_img){
                imageAlert.setAlertType(Alert.AlertType.WARNING);
                imageAlert.setContentText("Erro ao carregar imagem da questao ou imagem nao existe");
            }else{
                secondaryHBox.getChildren().add(imgT.getImgView());
            }
            ImageView imgView=new ImageView();

            //barchart
            CategoryAxis xAxis = new CategoryAxis();
            NumberAxis yAxis = new NumberAxis();
            BarChart<String,Number> barchartDados =
                    new BarChart<>(xAxis, yAxis);
            barchartDados.setTitle("Acertos");
            yAxis.setLabel("Valor");

            XYChart.Series<String, Number> seriesCurso = new XYChart.Series<>();
            seriesCurso.setName("Curso");
            XYChart.Series<String, Number> seriesRegiao = new XYChart.Series<>();
            seriesRegiao.setName("Regiao");
            XYChart.Series<String, Number> seriesBrasil = new XYChart.Series<>();
            seriesBrasil.setName("Brasil");
            NumberFormat ukFormat = NumberFormat.getNumberInstance(Locale.FRANCE);
            try {
                seriesCurso.getData().add(new XYChart.Data<>("Curso", ukFormat.parse(selectedItem.getAcertosCurso()).doubleValue()));
            } catch (ParseException e) {
                alert.setAlertType(Alert.AlertType.WARNING);
                alert.setContentText("Faltam dados");
            }
            try {
                seriesRegiao.getData().add(new XYChart.Data<>("Regiao", ukFormat.parse(selectedItem.getAcertosRegiao()).doubleValue()));
            } catch (ParseException e) {
                alert.setAlertType(Alert.AlertType.WARNING);
                alert.setContentText("Faltam dados");
            }
            try {
                seriesBrasil.getData().add(new XYChart.Data<>("Brasil", ukFormat.parse(selectedItem.getAcertosBrasil()).doubleValue()));
            } catch (ParseException e) {
                alert.setAlertType(Alert.AlertType.WARNING);
                alert.setContentText("Faltam dados");
            }


            barchartDados.getData().add(seriesCurso);
            barchartDados.getData().add(seriesRegiao);
            barchartDados.getData().add(seriesBrasil);
            barchartDados.setBarGap(0);
            barchartDados.setCategoryGap(0);
            barchartDados.setMinHeight(400);


            VBox dados=vBoxStart(selectedItem);
            dados.getChildren().add(barchartDados);
            secondaryHBox.getChildren().addAll(dados);

            Scene secondScene = new Scene(secondaryHBox, 1000, 700);

            // New window (Stage)
            Stage newWindow = new Stage();
            newWindow.setTitle("Questao"+ selectedItem.getIdQuestao()+"/"+selectedItem.getAno());
            newWindow.setScene(secondScene);
            newWindow.initModality(Modality.WINDOW_MODAL);
            newWindow.initOwner(stage);
            newWindow.setX(stage.getX() + 200);
            newWindow.setY(stage.getY() + 100);
            newWindow.show();
            if(alert.getAlertType()== Alert.AlertType.WARNING)
                alert.show();
            if(imageAlert.getAlertType()== Alert.AlertType.WARNING)
                imageAlert.show();
        });
        itemReload.setOnAction(t-> {
            try{
                csvFile.CSVReader();
            } catch (Exception e) {
                alert.setAlertType(Alert.AlertType.ERROR);
                alert.setContentText("Source isnt valid");
                alert.show();
            }
        });
        itemSource.setOnAction(t->{
            Label fileNameLabel = new Label("FileName.csv");
            Label urlLabel = new Label("URL");
            TextField fileNameText=new TextField();
            TextField urlText=new TextField();
            Button saveButton=new Button("Save");

            VBox secondaryVBox = new VBox();
            secondaryVBox.getChildren().addAll(fileNameLabel,fileNameText,urlLabel,urlText,saveButton);

            Scene secondScene = new Scene(secondaryVBox, 300, 200);

            // New window (Stage)
            Stage newWindow = new Stage();
            newWindow.setTitle("Source");
            newWindow.setScene(secondScene);
            newWindow.initModality(Modality.WINDOW_MODAL);
            newWindow.initOwner(stage);
            newWindow.setX(stage.getX() + 200);
            newWindow.setY(stage.getY() + 100);
            newWindow.show();

            saveButton.setOnAction(s->{
                csvFile.setFileName(fileNameText.getText());
                csvFile.setUrl(urlText.getText());
                newWindow.close();
            });
        });
        itemExit.setOnAction(t -> Platform.exit());
        itemAbout.setOnAction(t -> {
            Label secondLabel = new Label("Enade UFSM explorer by Gustavo Noll");

            StackPane secondaryLayout = new StackPane();
            secondaryLayout.getChildren().add(secondLabel);

            Scene secondScene = new Scene(secondaryLayout, 230, 100);

            // New window (Stage)
            Stage newWindow = new Stage();
            newWindow.setTitle("About");
            newWindow.setScene(secondScene);

            newWindow.initModality(Modality.WINDOW_MODAL);
            newWindow.initOwner(stage);
            newWindow.setX(stage.getX() + 200);
            newWindow.setY(stage.getY() + 100);

            newWindow.show();
        });
        VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(10, 10, 10, 10));
        vbox.getChildren().addAll(menuBar, table);
        stage.setTitle("Enade UFSM Explorer");
        stage.setScene(new Scene(vbox,1000,1000));
        stage.show();
        if(alert.getAlertType()!= Alert.AlertType.NONE)
            alert.show();
    }


    public static void main(String[] args) {
        launch(args);
    }

    private void tableStart(){
        TableColumn anoCol = new TableColumn("Ano");
        TableColumn provaCol = new TableColumn("Prova");
        TableColumn tipoQuestaoCol = new TableColumn("Tipo Questao");
        TableColumn idQuestaoCol = new TableColumn("ID Questao");
        TableColumn objetoCol = new TableColumn("Objeto");
        TableColumn acertosCursosCol = new TableColumn("Acertos Curso");
        TableColumn acertosRegiaoCol = new TableColumn("Acertos Região");
        TableColumn acertosBrasilCol = new TableColumn("Acertos Brasil");
        TableColumn difCol = new TableColumn("Dif. (Curso-Brasil)");

        anoCol.setCellValueFactory(new PropertyValueFactory<>("ano"));
        provaCol.setCellValueFactory(
                new PropertyValueFactory<>("prova"));
        tipoQuestaoCol.setCellValueFactory(
                new PropertyValueFactory<>("tipoQuestao"));
        idQuestaoCol.setCellValueFactory(
                new PropertyValueFactory<>("idQuestao"));
        objetoCol.setCellValueFactory(
                new PropertyValueFactory<>("objeto"));
        acertosCursosCol.setCellValueFactory(
                new PropertyValueFactory<>("acertosCurso"));
        acertosRegiaoCol.setCellValueFactory(
                new PropertyValueFactory<>("acertosRegiao"));
        acertosBrasilCol.setCellValueFactory(
                new PropertyValueFactory<>("acertosBrasil"));
        difCol.setCellValueFactory(
                new PropertyValueFactory<>("dif"));
        table.getColumns().addAll(anoCol, provaCol, tipoQuestaoCol,idQuestaoCol,objetoCol,acertosCursosCol,acertosRegiaoCol,acertosBrasilCol,difCol);
        table.setMinHeight(900);
    }

    private VBox vBoxStart(DataEntry selectedItem){
        VBox vbox=new VBox();
        Label anoLabel=new Label("Ano:" + selectedItem.getAno());
        anoLabel.setFont(new Font("Arial",20));
        Label provaLabel=new Label("Prova:" + selectedItem.getProva());
        provaLabel.setFont(new Font("Arial",20));
        Label tipoQuestaoLabel=new Label("Tipo questao:" + selectedItem.getTipoQuestao());
        tipoQuestaoLabel.setFont(new Font("Arial",20));
        Label idQuestaoLabel=new Label("ID questao:" + selectedItem.getIdQuestao());
        idQuestaoLabel.setFont(new Font("Arial",20));
        Label objetoLabel=new Label("Objeto:" + selectedItem.getObjeto());
        objetoLabel.setFont(new Font("Arial",20));
        Label acertosCursosLabel=new Label("Acertos curso:" + selectedItem.getAcertosCurso());
        acertosCursosLabel.setFont(new Font("Arial",20));
        Label acertosRegiaoLabel=new Label("Acertos regiao:" + selectedItem.getAcertosRegiao());
        acertosRegiaoLabel.setFont(new Font("Arial",20));
        Label acertosBrasilLabel=new Label("Acertos brasil:" + selectedItem.getAcertosBrasil());
        acertosBrasilLabel.setFont(new Font("Arial",20));
        Label difLabel=new Label("Dif:" + selectedItem.getDif());
        difLabel.setFont(new Font("Arial",20));
        Label gabaritoLabel=new Label("Gabarito:" + selectedItem.getGabarito());
        gabaritoLabel.setFont(new Font("Arial",20));
        vbox.getChildren().addAll(anoLabel,provaLabel,tipoQuestaoLabel,idQuestaoLabel,objetoLabel,acertosCursosLabel,acertosRegiaoLabel,acertosBrasilLabel,difLabel,gabaritoLabel);
        return vbox;
    }
}
