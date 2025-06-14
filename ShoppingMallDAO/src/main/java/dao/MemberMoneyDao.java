package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utility.DBConnector;
import vo.MemberVO;
import vo.MenMonVo;

public class MemberMoneyDao {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<MenMonVo> getMemberMoney(){
		ArrayList<MenMonVo> list = new ArrayList<MenMonVo>();
		try {
			//1. 2.
			conn = DBConnector.getConnection();
			//3.
			String sql = "select me.custno, custname, grade , sum(price) price from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade  order by 4 desc";
			stmt = conn.prepareStatement(sql);
			//4.
			//5.
			rs = stmt.executeQuery();
			while(rs.next()) {
				MenMonVo vo = new MenMonVo();
				vo.setCustno(rs.getString("custno"));
				vo.setCustname(rs.getString("custname"));	
				vo.setGrade(rs.getString("grade"));
				vo.setPrice(rs.getString("price"));
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnector.disConnection(rs, stmt, conn);
		}
		return list;
	}
	public MemberVO getMember(int custno) {
		MemberVO vo = new MemberVO();
		try {
			conn = DBConnector.getConnection();
			
			String sql = "select * from member_tbl_02 where custno = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, custno);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				vo.setCustno(rs.getInt("custno"));
				vo.setAddress(rs.getString("address"));
				vo.setCity(rs.getString("city"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setPhone(rs.getString("phone"));
				//여러개
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vo;
	}
	
	
}
