package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utill.DBConnector;
import vo.BookVO;

public class BookDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<BookVO> getBookList(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		try {
			conn = DBConnector.getConnection();
			String sql = "select book_code,book_name,book_type,book_author,	to_char(in_date, 'yyyy-mm-dd') as in_date, case when stat_fg = 0 then '대여가능' when stat_fg = 1 then '대여중' end as stat_fg from book_tbl_001";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setBookCode(rs.getString("book_code"));
				vo.setBookName(rs.getString("book_name"));
				vo.setBookType(rs.getString("book_type"));
				vo.setBookAuthor(rs.getString("book_author"));
				vo.setInDate(rs.getDate("in_date"));
				vo.setStatFg(rs.getString("stat_fg"));				
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return list;
	}
	public String addBook (BookVO vo){
		String msg = "";
		try {
			conn = DBConnector.getConnection();
			String sql = "insert into book_tbl_001 values(?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getBookCode());
			stmt.setString(2, vo.getBookName());
			stmt.setString(3, vo.getBookType());
			stmt.setString(4, vo.getBookAuthor());
			stmt.setDate(5, vo.getInDate());
			stmt.setString(6, vo.getStatFg());
			if(0< stmt.executeUpdate()) {
				msg = "추가 성공";
			}
			else {
				msg = "추가 실패";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return msg;
	}
	public void editBookAction(BookVO vo){
		try {
			Connection conn = DBConnector.getConnection();
			String sql = "UPDATE book_tbl_001 SET book_name = ?, book_type = ?, book_author = ?, in_date = ?, stat_fg = ? WHERE book_code = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getBookName());
			stmt.setString(2, vo.getBookType());
			stmt.setString(3, vo.getBookAuthor());
			stmt.setDate(4, vo.getInDate());
			stmt.setString(5, vo.getStatFg());
			stmt.setString(6, vo.getBookCode());
			stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(stmt, conn);
		}
	}
}
