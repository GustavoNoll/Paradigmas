
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.*;
import java.util.ArrayList;

public class FileController {
    public ArrayList<String> urls;
    ArrayList<Repositorio> repositorios;
    public ObservableList<DataEntry> data= FXCollections.observableArrayList();

    public FileController() {
        this.urls=new ArrayList<>();
        this.repositorios=new ArrayList<>();
    }

    public void setUrlRepositories(File file){
        String line;
        try {
            BufferedReader lerArq = new BufferedReader(new FileReader(file));
            while ((line = lerArq.readLine()) != null) {
                urls.add(line);
                Repositorio aux=new Repositorio(line);
                repositorios.add(aux);
            }
            lerArq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
    }
    public void repositorioToDataEntry(){
        for(int i=0;i<repositorios.size();i++) {
            DataEntry aux = new DataEntry(repositorios.get(i).getUrl(), repositorios.get(i).getNumeroCommits(), repositorios.get(i).getMediaTamMensagem());
            data.add(aux);
        }
    }
    public void committerAll(){
        for(int i=0;i<repositorios.size();i++) {
            repositorios.get(i).committer();
        }
    }
    public void clearAll(){
        urls.clear();
        repositorios.clear();
        data.clear();
    }
}
