package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("fdto")
public class FaqDto {
	private String num;
	private String ftitle;
	private String fcontent;
	private String faqtype;
	private Timestamp writeday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFaqtype() {
		return faqtype;
	}
	public void setFaqtype(String faqtype) {
		this.faqtype = faqtype;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}	
}
