package vo;

import java.sql.Date;

public class MemberVO {
	private int custNo;
	private String custName;
	private String phone;
	private String address;
	private Date joinDate;
	private String statFg;
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getStatFg() {
		return statFg;
	}
	public void setStatFg(String statFg) {
		this.statFg = statFg;
	}
	
}
