package userscore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.UserDTO;
import userbet.userBetDTO;
import util.DatabaseUtil;

public class userScoreDAO {
	
	public int setPoint(UserDTO user, int score){
	String SQL ="INSERT INTO SCORE(USERID, GETPOINT) VALUES (?,?)";
	try{
		Connection conn =DatabaseUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserID());
		pstmt.setInt(2, score);
		return pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	return -1;
}

}
