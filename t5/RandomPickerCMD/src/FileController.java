import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.*;
import java.net.*;
import java.io.*;

public class FileController {
    private ArrayList<String> txtNames;
    private String arqName;

    public FileController(String arqName) {
        this.arqName=arqName;
        txtNames=new ArrayList<String>();
        setTxtNames();
    }

    private void setTxtNames() {
        try {
            FileReader arq = new FileReader(arqName);
            BufferedReader lerArq = new BufferedReader(arq);
            String linha = lerArq.readLine();
            // lê a primeira linha
            // a variável "linha" recebe o valor "null" quando o processo
            while (linha != null) {
                txtNames.add(linha);
                linha = lerArq.readLine();
                // lê da segunda até a última linha
            }

            arq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n",
                    e.getMessage());
        }
    }

    private void getTxtNames() throws IOException {
        for (String txtName : txtNames) {
            System.out.println(txtName);
            System.out.println("Press Enter to continue...");
            System.in.read();
        }
    }
    public int getSize(){
        return txtNames.size();
    }

    public void randomOff() throws IOException {
        //embaralha
        Collections.shuffle(txtNames);
        //mostra
        getTxtNames();
    }
    public void randomOn() throws IOException {
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
            // Lê resposta, linha por linha
            String responseLine;
            while ((responseLine = in.readLine()) != null) {
                txtNames.add(responseLine);
            }
            in.close();
            //mostra
            getTxtNames();

        } catch (IOException e) {
            randomOff();
            e.printStackTrace();
        }
    }
}