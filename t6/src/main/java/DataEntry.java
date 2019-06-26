import javafx.beans.property.SimpleStringProperty;

public class DataEntry {
    private SimpleStringProperty ano;
    private SimpleStringProperty prova;
    private  SimpleStringProperty tipoQuestao;
    private  SimpleStringProperty idQuestao;
    private  SimpleStringProperty objeto;
    private  SimpleStringProperty acertosCurso;
    private  SimpleStringProperty acertosRegiao;
    private  SimpleStringProperty acertosBrasil;
    private  SimpleStringProperty dif;
    private  SimpleStringProperty gabarito;
    private  SimpleStringProperty imagem;


    public DataEntry(String ano, String prova, String tipoQuestao, String idQuestao, String objeto, String acertosCurso, String acertosRegiao, String acertosBrasil, String dif, String gabarito,String imagem) {
        this.ano = new SimpleStringProperty(ano);
        this.prova = new SimpleStringProperty(prova);
        this.tipoQuestao =new SimpleStringProperty(tipoQuestao);
        this.idQuestao =new SimpleStringProperty(idQuestao);
        this.objeto =new SimpleStringProperty(objeto);
        this.acertosCurso =new SimpleStringProperty(acertosCurso);
        this.acertosRegiao =new SimpleStringProperty(acertosRegiao);
        this.acertosBrasil =new SimpleStringProperty(acertosBrasil);
        this.dif =new SimpleStringProperty(dif);
        this.gabarito=new SimpleStringProperty(gabarito);
        this.imagem=new SimpleStringProperty(imagem);
    }
    public SimpleStringProperty anoProperty() {
        return ano;
    }
    public String getAno() {
        return ano.get();
    }
    public void setAno(String f) {
        ano.set(f);
    }

    public SimpleStringProperty provaProperty() {
        return prova;
    }
    public String getProva() {
        return prova.get();
    }
    public void setProva(String s) {
        prova.set(s);
    }

    public SimpleStringProperty tipoQuestaoProperty() {
        return tipoQuestao;
    }
    public String getTipoQuestao() {
        return tipoQuestao.get();
    }
    public void setTipoQuestao(String s) {
        tipoQuestao.set(s);
    }

    public SimpleStringProperty idQuestaoProperty() {
        return idQuestao;
    }
    public String getIdQuestao() {
        return idQuestao.get();
    }
    public void setIdQuestao(String s) {
        idQuestao.set(s);
    }

    public SimpleStringProperty objetoProperty() {
        return objeto;
    }
    public String getObjeto() {
        return objeto.get();
    }
    public void setObjeto(String s) {
        objeto.set(s);
    }

    public SimpleStringProperty acertosCursoProperty() {
        return acertosCurso;
    }
    public String getAcertosCurso() {
        return acertosCurso.get();
    }
    public void setAcertosCurso(String s) {
        acertosCurso.set(s);
    }

    public SimpleStringProperty acertosRegiaoProperty() {
        return acertosRegiao;
    }
    public String getAcertosRegiao() {
        return acertosRegiao.get();
    }
    public void setAcertosRegiao(String s) {
        acertosRegiao.set(s);
    }

    public SimpleStringProperty acertosBrasilProperty() {
        return acertosBrasil;
    }
    public String getAcertosBrasil() {
        return acertosBrasil.get();
    }
    public void setAcertosBrasil(String s) {
        acertosBrasil.set(s);
    }

    public SimpleStringProperty difProperty() {
        return dif;
    }
    public String getDif() {
        return dif.get();
    }
    public void setDif(String s) {
        dif.set(s);
    }

    public SimpleStringProperty gabaritoProperty() {
        return gabarito;
    }
    public String getGabarito() {
        return gabarito.get();
    }
    public void setGabarito(String s) {
        gabarito.set(s);
    }

    public SimpleStringProperty imagemProperty() {
        return imagem;
    }
    public String getImagem() {
        return imagem.get();
    }
    public void setImagem(String s) {
        imagem.set(s);
    }

}
