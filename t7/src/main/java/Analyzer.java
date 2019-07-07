import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import javafx.collections.FXCollections;
import javafx.collections.ObservableArray;
import javafx.collections.ObservableList;

public class Analyzer extends Thread{
    public Boolean pageRoll;

    public Analyzer() {
        this.pageRoll = true;
    }
    public void run(){
        System.out.println("run");
    }

    public Collection<Commit> getCommitsperPage(String id, String repositorio, int pageI) throws IOException {
        String urlstr = "https://api.github.com/repos/"+ id +"/"+ repositorio +"/commits?page=" + pageI;

        URL url = new URL(urlstr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        System.out.println("Response code: " + con.getResponseCode());
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        System.out.println(con.getHeaderFields().get("Link").get(0));
        JsonParser parser = new JsonParser();
        JsonArray results = parser.parse(in.readLine()).getAsJsonArray();
        System.out.println("Size: "+ results.size());


        if(results.size()<30){
            this.pageRoll=false;
        }
        ArrayList<Commit> commits = new ArrayList<>();
        for (JsonElement e : results) {
            String message = e.getAsJsonObject().get("commit").getAsJsonObject().get("message").toString();
            String date = e.getAsJsonObject().get("commit").getAsJsonObject().get("author").getAsJsonObject().get("date").toString();
            Commit commit = new Commit(message,date);
            commits.add(commit);
        }
        return commits;
    }
}
