package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;



@Alias("mdto")
public class MemberDto {
  private int num;
  private String name;
  private String id;
  private String pass;
  private String addrnum;
  private String addr;
  private String addrdetail;
  private String hp;
  private String hp1;
  private String hp2;
  private String hp3;
  private String selegender;
  private String birth;
  private String height;
  private String weight;
  private String email;
  private String email1;
  private String email2;
  private Timestamp gaipday;

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPass() {
    return pass;
  }

  public void setPass(String pass) {
    this.pass = pass;
  }

  public String getAddrnum() {
    return addrnum;
  }

  public void setAddrnum(String addrnum) {
    this.addrnum = addrnum;
  }

  public String getAddr() {
    return addr;
  }

  public void setAddr(String addr) {
    this.addr = addr;
  }

  public String getAddrdetail() {
    return addrdetail;
  }

  public void setAddrdetail(String addrdetail) {
    this.addrdetail = addrdetail;
  }

  public String getHp() {
    return hp;
  }

  public void setHp(String hp) {
    this.hp = hp;
  }

  public String getHp1() {
    return hp1;
  }

  public void setHp1(String hp1) {
    this.hp1 = hp1;
  }

  public String getHp2() {
    return hp2;
  }

  public void setHp2(String hp2) {
    this.hp2 = hp2;
  }

  public String getHp3() {
    return hp3;
  }

  public void setHp3(String hp3) {
    this.hp3 = hp3;
  }

  public String getSelegender() {
    return selegender;
  }

  public void setSelegender(String selegender) {
    this.selegender = selegender;
  }

  public String getBirth() {
    return birth;
  }

  public void setBirth(String birth) {
    this.birth = birth;
  }

  public String getHeight() {
    return height;
  }

  public void setHeight(String height) {
    this.height = height;
  }

  public String getWeight() {
    return weight;
  }

  public void setWeight(String weight) {
    this.weight = weight;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getEmail1() {
    return email1;
  }

  public void setEmail1(String email1) {
    this.email1 = email1;
  }

  public String getEmail2() {
    return email2;
  }

  public void setEmail2(String email2) {
    this.email2 = email2;
  }

  public Timestamp getGaipday() {
    return gaipday;
  }

  public void setGaipday(Timestamp gaipday) {
    this.gaipday = gaipday;
  }



}
