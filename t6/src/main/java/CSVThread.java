import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;

public class CSVThread  extends Thread{
    private String url;
    private String fileName;
    private Boolean baixou;

    public CSVThread(String url, String fileName) {
        this.url = url;
        this.fileName = fileName;
        this.baixou = false;
    }

    public Boolean getBaixou() {
        return baixou;
    }

    public void run(){
        try(InputStream in = URI.create(url).toURL().openStream()) {
            Files.copy(in, Paths.get(fileName));
            baixou=true;
        } catch (IOException e) {
            baixou=false;
        }
    }
}
