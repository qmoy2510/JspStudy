package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.VO.UserVO;
import utill.DBConnection;

public class UserDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	public UserVO getUser(String id, String password) {
		UserVO vo = null;
		//db작업을 해서 넘겨주기
		try {
			conn = DBConnection.getConection();
			//3. 질의문 준비
			String sql = " select * from users where id = ? and password = ?";
			stmt = conn.prepareStatement(sql);
			
			//4. 질의문 세팅
			stmt.setString(1, id);
			stmt.setString(2, password);
			
			//5. 질의문 실행
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				vo = new UserVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			//6. 질의문 닫기
		}
		
		return vo;
	}
}
