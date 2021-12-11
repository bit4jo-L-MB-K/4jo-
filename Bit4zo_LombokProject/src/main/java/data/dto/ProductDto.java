package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;


@Alias("pdto")
public class ProductDto {

  private String idx;
  private String pro_id;
  private String pro_name;
  private String price;
  private int readcount;
  private String stock;
  private String pro_sub;
  private String pro_photo;
  private String pro_content;
  private MultipartFile upload;
  private Timestamp ipgoday;
  private String price_n;
  private ProductOpDto joindto2;



  public ProductOpDto getJoindto2() {
    return joindto2;
  }

  public void setJoindto2(ProductOpDto joindto2) {
    this.joindto2 = joindto2;
  }

  public String getPrice_n() {
    return price_n;
  }

  public void setPrice_n(String price_n) {
    this.price_n = price_n;
  }



  public String getStock() {
    return stock;
  }

  public void setStock(String stock) {
    this.stock = stock;
  }

  public String getIdx() {
    return idx;
  }

  public void setIdx(String idx) {
    this.idx = idx;
  }

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
