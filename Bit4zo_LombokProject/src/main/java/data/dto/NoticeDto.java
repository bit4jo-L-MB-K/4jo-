package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;

@Alias("ndto")
public class NoticeDto {
  private String num;
  private String nsubject;
  private String ncontent;
  private String noticetype;
  private Timestamp writeday;

  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

  public String getNsubject() {
    return nsubject;
  }

  public void setNsubject(String nsubject) {
    this.nsubject = nsubject;
  }

  public String getNcontent() {
    return ncontent;
  }

  public void setNcontent(String ncontent) {
    this.ncontent = ncontent;
  }

  public String getNoticetype() {
    return noticetype;
  }

  public void setNoticetype(String noticetype) {
    this.noticetype = noticetype;
  }

  public Timestamp getWriteday() {
    return writeday;
  }

  public void setWriteday(Timestamp writeday) {
    this.writeday = writeday;
  }


}
