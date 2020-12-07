package org.kzv.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {
	private int pageNum;
	private int amount;
	
	public PagingVO() {
		this(1,10);
	}
	
	public PagingVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
