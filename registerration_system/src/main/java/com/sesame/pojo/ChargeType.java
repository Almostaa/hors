package com.sesame.pojo;

/**
 * 收费类型表
 * @author JChiang
 * @currentTime 2020年11月10日下午2:41:37
 */
public class ChargeType {
	
	private Integer priceTypeNo;
	private String  priceTypeName;	
	
	
	public ChargeType(Integer priceTypeNo, String priceTypeName) {
		super();
		this.priceTypeNo = priceTypeNo;
		this.priceTypeName = priceTypeName;
	}
	public ChargeType() {
		super();
	}
	public Integer getPriceTypeNo() {
		return priceTypeNo;
	}
	public void setPriceTypeNo(Integer priceTypeNo) {
		this.priceTypeNo = priceTypeNo;
	}
	public String getPriceTypeName() {
		return priceTypeName;
	}
	public void setPriceTypeName(String priceTypeName) {
		this.priceTypeName = priceTypeName;
	}
	@Override
	public String toString() {
		return "ChangeType [priceTypeNo=" + priceTypeNo + ", priceTypeName=" + priceTypeName + "]";
	}
	

}
