package data.dto;

import org.apache.ibatis.type.Alias;

@Alias("podto")
public class ProductOpDto {

  private String num;
  private String pro_id;
  private String color;
  private int s;
  private int m;
  private int l;
  private ProductDto joindto;


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

  public int getS() {
    return s;
  }

  public void setS(int s) {
    this.s = s;
  }

  public int getM() {
    return m;
  }

  public void setM(int m) {
    this.m = m;
  }

  public int getL() {
    return l;
  }

  public void setL(int l) {
    this.l = l;
  }

}
