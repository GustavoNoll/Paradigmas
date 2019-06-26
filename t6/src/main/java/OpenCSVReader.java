import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.io.*;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class OpenCSVReader {
    private String url;
    private String fileName;
    public ObservableList<DataEntry> data= FXCollections.observableArrayList();


    public OpenCSVReader() {
        this.url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTO06Jdr3J1kPYoTPRkdUaq8XuslvSD5--FPMht-ilVBT1gExJXDPTiX0P3FsrxV5VKUZJrIUtH1wvN/pub?gid=0&single=true&output=csv";
        this.fileName="enade.csv";
    }

    private void CSVReaderAux() throws IOException {
        try (
            Reader reader = Files.newBufferedReader(Paths.get(fileName));
            CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build()
        ){
            String[] nextRecord;
            while ((nextRecord = csvReader.readNext()) != null) { DataEntry record=new DataEntry(nextRecord[1],nextRecord[2],nextRecord[3],nextRecord[4],nextRecord[5],
                        nextRecord[8],nextRecord[9],nextRecord[10],nextRecord[11],nextRecord[7],nextRecord[17]);
            data.add(record);
            }
        }
    }

    public void CSVReader() throws IOException {
        try {
            Path path = Files.createTempFile(fileName, ".csv");
            if(Files.exists(path)){
                data.clear();
                CSVReaderAux();
            }
        } catch (IOException e) {
            try(InputStream in = URI.create(url).toURL().openStream()) {
                Files.copy(in, Paths.get(fileName));
                data.clear();
                CSVReaderAux();
            }
        }
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public void setFileName(String fileName){
        this.fileName=fileName;
    }
}