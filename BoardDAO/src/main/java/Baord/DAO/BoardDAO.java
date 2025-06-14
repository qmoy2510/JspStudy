package Baord.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Board.VO.BoardVO;
import utill.DBConnection;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<BoardVO> getBoardList(String searchCondition, String searchKeyword){
		ArrayList<BoardVO> bList = new ArrayList<BoardVO>();

		try {
			//1.2.
			conn = DBConnection.getConection();
			//3. 질의문 준비
			String sql = "select * from board ";
			if(searchCondition.equals("TITLE")) {
				sql += " where title like '%'||?||'%' ";
			}
			else {
				sql += " where content like '%'||?||'%' ";
			}
			sql += " order by seq desc ";
			
			stmt = conn.prepareStatement(sql);
			
			//4. 질의문 세팅
			stmt.setString(1, searchKeyword);
			//5. 질의문 실행
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setNickname(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setUserid(rs.getString("userid"));
				
				bList.add(vo);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnection.disconnection(rs, stmt, conn);
		}
		
		return bList;
	}
	
	public BoardVO getBoard(int seq) {
		BoardVO vo= null;
		
		try {
			conn = DBConnection.getConection();
			
			String sql = "update board set cnt = cnt + 1 where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, seq);
			stmt.executeUpdate();
			
			stmt.close();
			
			sql = "select * from board where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, seq);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				
				vo.setSeq(seq);
				vo.setNickname(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setUserid(rs.getString("userid"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.disconnection(rs, stmt, conn);
		}
		return vo;
	}
	
	public int updateBoard(BoardVO vo) {
		int result = 0;
		try {
			conn = DBConnection.getConection();
			
			//질의문 준비
			String sql = "update board set title = ?, content = ? where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			//질의문 세팅
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			
			//질의문 실행
			result = stmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.disconnection(stmt, conn);
		}
		return result;
	}
	public int deleteBoard(int seq) {
		int result = 0;
		try {
			conn = DBConnection.getConection();
			
			String sql = "delete board where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, seq);
			
			result = stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.disconnection(stmt, conn);
		}
		
		return result;
	}
	public int addboard(BoardVO vo) {
		int result = 0;
		try {
			conn = DBConnection.getConection();
			
			String sql = "insert into board(seq, title, nickname, content, regdate, userid) "
					+ " values((select nvl(max(seq), 0)+1 from board), ?, ?, ?, sysdate, ?) ";
			stmt = conn.prepareStatement(sql);     
			
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getNickname());
			stmt.setString(3, vo.getContent());
			stmt.setString(4, vo.getUserid());
			
			result = stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.disconnection(stmt, conn);
		}
		
		return result;
	}
}
