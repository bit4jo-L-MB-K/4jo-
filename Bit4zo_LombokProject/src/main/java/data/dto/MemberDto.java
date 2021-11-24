package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
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
}