import java.io.IOException;

public class RandomPickerCMD {

    public static void main(String[] args) throws IOException {
        //arquivo deve estar na pasta do projeto
        FileController arquivoTXT=new FileController("names.txt");
        if(arquivoTXT.getSize()<50){
            arquivoTXT.randomOff();
        }else{
            arquivoTXT.randomOn();
        }
    }
}
