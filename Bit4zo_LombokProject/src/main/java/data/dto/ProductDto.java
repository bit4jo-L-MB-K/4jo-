package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;


@Alias("pdto")
public class ProductDto {

  private String num;
  private String pro_id;
  private String pro_name;
  private String price;
  private int readcount;
  private int stock;
  private String pro_sub;
  private String pro_photo;
  private String pro_content;
  private MultipartFile upload;
  private Timestamp ipgoday;

  public int getReadcount() {
    return readcount;
  }

  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }

  public MultipartFile getUpload() {
    return upload;
  }

  public void setUpload(MultipartFile upload) {
    this.upload = upload;
  }

  public String getPrice() {
    return price;
  }

  public void setPrice(String price) {
    this.price = price;
  }

  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

  public String getPro_id() {
    return pro_id;
  }

  public void setPro_id(String pro_id) {
    this.pro_id = pro_id;
  }

  public String getPro_name() {
    return pro_name;
  }

  public void setPro_name(String pro_name) {
    this.pro_name = pro_name;
  }

  public int getStock() {
    return stock;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }

  public String getPro_sub() {
    return pro_sub;
  }

  public void setPro_sub(String pro_sub) {
    this.pro_sub = pro_sub;
  }

  public String getPro_photo() {
    return pro_photo;
  }

  public void setPro_photo(String pro_photo) {
    this.pro_photo = pro_photo;
  }

  public String getPro_content() {
    return pro_content;
  }

  public void setPro_content(String pro_content) {
    this.pro_content = pro_content;
  }

  public Timestamp getIpgoday() {
    return ipgoday;
  }

  public void setIpgoday(Timestamp ipgoday) {
    this.ipgoday = ipgoday;
  }


}
