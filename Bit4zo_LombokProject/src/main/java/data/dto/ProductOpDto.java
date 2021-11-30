package data.dto;

import org.apache.ibatis.type.Alias;

@Alias("podto")
public class ProductOpDto {

  private String num;
  private String pro_id;
  private String color;
  private String s;
  private String m;
  private String l;
  private ProductDto joindto;



  public String getS() {
    return s;
  }

  public void setS(String s) {
    this.s = s;
  }

  public String getM() {
    return m;
  }

  public void setM(String m) {
    this.m = m;
  }

  public String getL() {
    return l;
  }

  public void setL(String l) {
    this.l = l;
  }

  public ProductDto getJoindto() {
    return joindto;
  }

  public void setJoindto(ProductDto joindto) {
    this.joindto = joindto;
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



}
