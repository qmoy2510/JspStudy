package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utility.DBConnector;
import vo.MemberVO;
import vo.MenMonVo;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public int getMember() {
		
		int custno = 011;
		try {
			conn = DBConnector.getConnection();
			//3. 질의문 준비
			String sql = "select max(custno) custno "
					+ "  FROM member_tbl_02";
			stmt = conn.prepareStatement(sql);
			//5. 질의문 실행
			rs = stmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt("custno");
				return custno;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {	
			DBConnector.disConnection(rs, stmt, conn);
		}
		return custno;
	}
	public MemberVO getMember(int custno) {
		
		MemberVO vo = new MemberVO();
		try {
			conn = DBConnector.getConnection();
			//3. 질의문 준비
			String sql = "select * from member_tbl_02 where custno = " + custno;
			stmt = conn.prepareStatement(sql);
			//5. 질의문 실행
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo.setCustno(custno);
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				return vo;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {	
			DBConnector.disConnection(rs, stmt, conn);
		}
		return vo;
	}
	
	public String addMember(MemberVO vo) {
		String msg = null;
		try {
			conn = DBConnector.getConnection();
			//3.
			String sql  = "insert into member_tbl_02 values ((select nvl (max (custno), 10000) + 1 from member_tbl_02),?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			//4.
			stmt.setString(1, vo.getCustname());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getAddress());
			stmt.setDate(4, vo.getJoindate());
			stmt.setString(5, vo.getGrade());
			stmt.setString(6, vo.getCity());
			
			//5.
			if(stmt.executeUpdate()>0) {
				msg="저장 되었습니다.";
			}
			else {
				msg="저장에 실패했습니다..";
			}
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally {
			DBConnector.disConnection(stmt, conn);
		}
		return msg;
	}
	public ArrayList<MemberVO> getMemberList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			//1. 2.
			conn = DBConnector.getConnection();
			//3.
			String sql = "select * from member_tbl_02";
			stmt = conn.prepareStatement(sql);
			//4.
			//5.
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("Custname"));
				vo.setPhone(rs.getString("Phone"));
				vo.setAddress(rs.getString("Address"));
				vo.setJoindate(rs.getDate("Joindate"));
				vo.setGrade(rs.getString("Grade"));
				vo.setCity(rs.getString("City"));
				list.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return list;
	}
	
	public String editMember(MemberVO vo) {
		String msg = null;
		
		try {
			conn = DBConnector.getConnection();
			String sql = "update member_tbl_02 set custname = ?, phone = ?, address =?, joindate = ?, grade = ?, city = ? where custno = ?";
			
			stmt = conn.prepareStatement(sql);
			//4.
			stmt.setString(1, vo.getCustname());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getAddress());
			stmt.setDate(4, vo.getJoindate());
			stmt.setString(5, vo.getGrade());
			stmt.setString(6, vo.getCity());
			stmt.setInt(7, vo.getCustno());
			
			if(stmt.executeUpdate()>0) {
				msg ="저장 되었습니다.";
				
			}
			else {
				msg="저장에 실패했습니다..";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.disConnection(stmt, conn);
		}
		return msg;
	}
	
}
