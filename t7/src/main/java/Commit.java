public class Commit {
    private String mensagem;
    private String data;

    public Commit(String mensagem, String data) {
        this.mensagem = mensagem;
        this.data = data;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}