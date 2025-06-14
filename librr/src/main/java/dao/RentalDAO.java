package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utill.DBConnector;
import vo.MemberVO;
import vo.RentalVO;

public class RentalDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public RentalVO addBook() {
		RentalVO vo = new RentalVO();
		try {
			conn = DBConnector.getConnection();
			String sql = "SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') as s, TO_CHAR(SYSDATE, 'YYYYMMDD')+7 as ss, TO_Char(nvl(max(rent_no),0)+1, 'FM00000') as rentNo FROM rental_tbl_001";
			stmt = conn.prepareStatement(sql);
			vo.setCloseYmd(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo.setRentYmd(rs.getString("s"));
				vo.setRentNo(rs.getString("rentNo"));
				vo.setReturnYmd(rs.getString("ss"));
			}
			return vo;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBConnector.disConnection(rs, stmt, conn);
		}	
		return vo;
	}
	public String addBookAction(RentalVO vo) {
		String msg = null;
		try {
			conn = DBConnector.getConnection();
			
			String sql = "INSERT INTO rental_tbl_001 VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), (SELECT TO_CHAR(NVL(MAX(rent_no), 0) + 1, 'FM00000') FROM rental_tbl_001), ?, ?, TO_CHAR(SYSDATE + 7, 'YYYYMMDD'), NULL, NULL)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, vo.getRentBook());
			stmt.setInt(2, vo.getRentRent());
			
			if(stmt.executeUpdate()>0) {
				msg="대여도서등록에 성공하였습니다.";
			}
			else {
				msg="대여도서등록에 실패하였습니다.";
			}
			return msg;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(stmt, conn);
		}
		
		return msg;
	}
	public ArrayList<RentalVO> getRentalList(){
		ArrayList<RentalVO> list = new ArrayList<RentalVO>();
		try {
			conn = DBConnector.getConnection();
			String sql = "select rent_ymd, rent_no, rent_book, book_name, rent_rent, cust_name, close_ymd from member_tbl_001, RENTAL_TBL_001, book_tbl_001 where book_code = rent_book and rent_rent = cust_no order by rent_ymd, rent_no, rent_book asc";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				RentalVO vo = new RentalVO();
				vo.setRentYmd(rs.getString("rent_ymd"));
				vo.setRentNo(rs.getString("rent_no"));
				vo.setRentBook(rs.getString("rent_book"));
				vo.setCloseYmd(rs.getString("book_name"));
				vo.setRentRent(rs.getInt("rent_rent"));
				vo.setReturnYmd(rs.getString("cust_name"));
				vo.setReturnFg(rs.getString("close_ymd"));
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
}
