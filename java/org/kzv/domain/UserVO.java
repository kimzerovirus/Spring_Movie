package org.kzv.domain;

import lombok.Data;

@Data
public class UserVO {
	private int idx;
	private String userid;
	private String name;
	private String pwd;
	private java.sql.Date indate;
}
