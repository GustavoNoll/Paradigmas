import javafx.beans.property.SimpleFloatProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class DataEntry {
    private SimpleStringProperty url;
    private SimpleFloatProperty mensagemCommit;
    private SimpleIntegerProperty numeroCommit;


    public DataEntry(String url,int numeroCommit,float mensagemCommit) {
        this.url = new SimpleStringProperty(url);
        this.mensagemCommit = new SimpleFloatProperty(mensagemCommit);
        this.numeroCommit=new SimpleIntegerProperty(numeroCommit);
    }
    public SimpleStringProperty urlProperty() {
        return url;
    }
    public String getUrl() {
        return url.get();
    }
    public void setUrl(String f) {
        url.set(f);
    }

    public SimpleFloatProperty mensagemCommitProperty() {
        return mensagemCommit;
    }
    public SimpleFloatProperty getMensagemCommit() {
        return mensagemCommit;
    }
    public void setMensagemCommit(float s) {
        mensagemCommit.set(s);
    }
    public void incTamoMensagem(float s) {
        mensagemCommit.set(mensagemCommit.getValue()+s);
    }

    public SimpleIntegerProperty numeroCommitProperty() {
        return numeroCommit;
    }
    public SimpleIntegerProperty getNumeroCommit() {
        return numeroCommit;
    }
    public void setNumeroCommit(int s) {
        numeroCommit.set(s);
    }


}
