package data.dto;

import org.apache.ibatis.type.Alias;

@Alias("podto")
public class ProductOpDto {

  private String num;
  private String pro_id;
  private String color;
  private String color_name;
  private String c_size;
  private String su;
  private ProductDto joindto;
  private String all_column;



  public String getAll_column() {
    return all_column;
  }

  public void setAll_column(String all_column) {
    this.all_column = all_column;
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

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public String getColor_name() {
    return color_name;
  }

  public void setColor_name(String color_name) {
    this.color_name = color_name;
  }

  public String getC_size() {
    return c_size;
  }

  public void setC_size(String c_size) {
    this.c_size = c_size;
  }

  public String getSu() {
    return su;
  }

  public void setSu(String su) {
    this.su = su;
  }

  public ProductDto getJoindto() {
    return joindto;
  }

  public void setJoindto(ProductDto joindto) {
    this.joindto = joindto;
  }



}
