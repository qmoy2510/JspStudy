package vo;

import java.sql.Date;

public class BookVO {
	private String bookCode;
	private String bookName;
	private String bookType;
	private String bookAuthor;
	private Date inDate;
	private String statFg;
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public String getStatFg() {
		return statFg;
	}
	public void setStatFg(String statFg) {
		this.statFg = statFg;
	}
	
	
}
