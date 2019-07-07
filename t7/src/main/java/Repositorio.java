import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

public class Repositorio{
    private String url;private String id;private String repositorioNome;
    private ArrayList<Commit> commits;
    private int numeroCommits;

    public Repositorio(String url) {
        this.setUrl(url);
        commits = null;
        numeroCommits = 0;
        this.repositorioAux();
    }
    private void repositorioAux() {
        try{
            String separador[] = this.url.split("/");
            repositorioNome = separador[separador.length-1];
            id = separador[separador.length -2];
        }catch(Exception E) {
            System.out.println("Erro na Url");
        }
    }
    public String getUrl() {
        return url;
    }

    public int getNumeroCommits() {
        return numeroCommits;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public float getMediaTamMensagem(){
        int aux=0;
        for(int i=0; i<this.numeroCommits;i++){
            aux+=this.commits.get(i).getMensagem().length();
        }
        return  aux/numeroCommits;
    }
    public void committer() {
        int i = 1;
        Collection<Commit> commitsList = null;
        commits=new ArrayList<>();
        try {
            Analyzer gitAux = new Analyzer();
            while((commitsList = gitAux.getCommitsperPage(id, repositorioNome, i)) != null){
                commits.addAll(commitsList);
                i++;
                if(gitAux.pageRoll==false)
                    break;
            }
        } catch (IOException e) {
            System.out.println("Erro na paginação");
        }
        this.numeroCommits = commits.size();
    }
}