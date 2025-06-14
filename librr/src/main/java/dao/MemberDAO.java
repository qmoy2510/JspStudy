package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utill.DBConnector;
import vo.MemberVO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberVO> getBookMemberList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			conn = DBConnector.getConnection();
			String sql = "select cust_no,cust_name,phone,address,joindate, case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' when stat_fg = 2 then '탈퇴' end as stat_fg from member_tbl_001";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustName(rs.getString("cust_name"));
				vo.setAddress(rs.getString("address"));
				vo.setCustNo(rs.getInt("cust_no"));
				vo.setJoinDate(rs.getDate("joindate"));
				vo.setPhone(rs.getString("phone"));
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
	public MemberVO addBookMember() { 
		MemberVO vo = new MemberVO();
		try {
			Connection conn = DBConnector.getConnection();
			String sql = "select nvl(max(cust_no), 10000)+1 as cust_no, to_char(sysdate, 'yyyy-mm-dd') as to_char from MEMBER_TBL_001";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				vo.setCustNo(rs.getInt("cust_no"));
				vo.setJoinDate(Date.valueOf(rs.getString("to_char")));
			}
			return vo;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return vo;
	}
	public MemberVO editBookMember(int custNo) { 
		MemberVO vo = new MemberVO();
		try {
			Connection conn = DBConnector.getConnection();
			String sql = "select * from MEMBER_TBL_001 where cust_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, custNo);
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo.setCustName(rs.getString("cust_name"));
				vo.setAddress(rs.getString("address"));
				vo.setCustNo(rs.getInt("cust_no"));
				vo.setJoinDate(rs.getDate("joindate"));
				vo.setPhone(rs.getString("phone"));
				vo.setStatFg(rs.getString("stat_fg"));
			}
			return vo;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return vo;
	}
	public void editBookMemberAction(MemberVO vo) {
		try {
			Connection conn = DBConnector.getConnection();
			String sql = "UPDATE member_tbl_001 SET cust_name = ?, phone = ?, address = ?, joindate = ?, stat_fg = ? WHERE cust_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustName());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getAddress());
			stmt.setDate(4, vo.getJoinDate());
			stmt.setString(5, vo.getStatFg());
			stmt.setInt(6, vo.getCustNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(stmt, conn);
		}
	}
	public void addBookMemberAction(MemberVO vo) {
		try {
			Connection conn = DBConnector.getConnection();
			String sql = "insert into member_tbl_001 values (?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getCustNo());
			stmt.setString(2, vo.getCustName());
			stmt.setString(3, vo.getPhone());
			stmt.setString(4, vo.getAddress());
			stmt.setDate(5, vo.getJoinDate());
			stmt.setString(6, vo.getStatFg());
			stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(stmt, conn);
		}
	}
}
