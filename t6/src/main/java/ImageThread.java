
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class ImageThread  extends Thread{
    private ImageView imgView;
    private String url;
    public Boolean falha_img;

    public ImageThread(String url) {
        this.imgView=new ImageView();
        this.url = url;
        this.falha_img=false;
    }

    public ImageView getImgView() {
        return imgView;
    }
    public void run(){
        try {
            Image img = new Image(url, 600, 500, true, true);
            imgView.setImage(img);
        } catch (Exception e) {
            this.falha_img=true;
        }
    }
}
