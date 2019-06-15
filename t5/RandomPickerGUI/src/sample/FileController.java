package sample;

import javafx.scene.control.TextArea;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.net.*;
import java.io.*;
import java.util.ArrayList;

public class FileController {
    private ArrayList<String> txtNames;
    private int controlNext;


    public FileController(){
        txtNames=new ArrayList<String>();
        controlNext=0;
    }

    public int getControlNext() {
        return controlNext;
    }

    public void setControlNext(int controlNext) {
        this.controlNext = controlNext;
    }

    public void incControl(){
        controlNext++;
    }

    public void setTxtNames(File file){
        this.txtNames.clear();
        String line;
        try {

            BufferedReader lerArq = new BufferedReader(new FileReader(file));

            while ((line = lerArq.readLine()) != null) {
                txtNames.add(line);
            }

            lerArq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
    }
    public void setTxtNames(TextArea textArea){
        this.txtNames.clear();
        for (String line : textArea.getText().split("\\n")){
            txtNames.add(line);
        }
    }

    public String getTxtNames(int i) {
            return txtNames.get(i);
    }

    public int getSize(){
        return txtNames.size();
    }

    public void randomOff(){
        if(txtNames.size()>0) {
            Collections.shuffle(txtNames);
        }
    }
    public void randomOn(){

        try {
            String urlstr = "https://www.random.org/lists/?mode=advanced";
            URL url = new URL(urlstr);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            con.setDoOutput(true);

            String finalUrl = "&format=plain&rnd=ne";
            String lineUrl = "%0D%0A";
            String dataUrl = "list=";
            for (int i = 0; i < txtNames.size(); i++) {
                if (i < txtNames.size() - 1)
                    dataUrl = dataUrl.concat(txtNames.get(i) + lineUrl);
                else
                    dataUrl = dataUrl.concat(txtNames.get(i));
            }


            dataUrl = dataUrl.concat(finalUrl);
            // Envia dados pela conexão aberta
            con.getOutputStream().write(dataUrl.getBytes(StandardCharsets.UTF_8));
            //System.out.println("Response code: " + con.getResponseCode());

            // Cria objeto que fará leitura da resposta pela conexão aberta
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            txtNames.clear();
            String responseLine;
            while ((responseLine = in.readLine()) != null) {
                txtNames.add(responseLine);
            }
            in.close();
        } catch (IOException e) {
            //sem conexao
            randomOff();
        }
    }
}
