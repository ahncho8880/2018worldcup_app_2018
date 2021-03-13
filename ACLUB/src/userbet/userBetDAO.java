package userbet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import answer.answerDTO;
import answerTeam.teamDTO;
import answerTeam.teamDAO;
import nowuserpoint.UserPointDTO;
import user.UserDTO;
import userscore.userScoreDTO;
import util.DatabaseUtil;

public class userBetDAO {
	
	public ArrayList<userScoreDTO> getTotalScore(){
		String SQL = "SELECT USERID,SUM(POINT) FROM USERBET GROUP BY USERID";
		ArrayList<userScoreDTO> list = new ArrayList<userScoreDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				userScoreDTO user = new userScoreDTO();
				user.setUserID(rs.getString(1));
				user.setSum(rs.getInt(2));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DatabaseUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	public userBetDTO setmatchNo(String userID){
		String SQL ="SELECT COUNT(USERID)+1 FROM USERBET WHERE USERID=?";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		userBetDTO user = new userBetDTO();
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user.setMatchNo(rs.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DatabaseUtil.close(conn, pstmt, rs);
		}
		return user;
	}
	
	public int uploadBet(int matchno, String userID, String team, int winScore, int loseScore, String result){
		String SQL ="INSERT INTO USERBET(matchNo, userID, team, winScore, loseScore, result) VALUES(?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn =DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, matchno);
			pstmt.setString(2, userID);
			pstmt.setString(3, team);
			pstmt.setInt(4, winScore);
			pstmt.setInt(5, loseScore);
			pstmt.setString(6, result);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			DatabaseUtil.close(pstmt);
			DatabaseUtil.close(conn);
		}
		return -1;
	}
	
	public int setpoint(userBetDTO answer, int point,UserDTO user){
		String SQL ="UPDATE USERBET SET POINT=? WHERE MATCHNO=? and USERID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, point);
			pstmt.setInt(2, answer.getMatchNo());
			pstmt.setString(3, user.getUserID());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			DatabaseUtil.close(pstmt);
			DatabaseUtil.close(conn);
		}
		return -1;
	}
	public ArrayList<userBetDTO> getusergame(UserDTO userid, teamDTO team){
		
		String SQL="SELECT TEAM, WINSCORE,LOSESCORE,POINT FROM USERBET WHERE USERID = ? AND MATCHNO = ?";
		ArrayList<userBetDTO> lists = new ArrayList<userBetDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userid.getUserID());
			pstmt.setInt(2, team.getNo());
			rs= pstmt.executeQuery();
			while(rs.next()){
				userBetDTO user = new userBetDTO();
				user.setTeam(rs.getString(1));
				user.setWinScore(rs.getInt(2));
				user.setLoseScore(rs.getInt(3));
				user.setPoint(rs.getInt(4));
				lists.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DatabaseUtil.close(conn, pstmt, rs);
		}
		return lists;
	}
	public ArrayList<userBetDTO> gettotalgame(UserDTO userid){
		
		String SQL="SELECT TEAM, WINSCORE,LOSESCORE FROM USERBET WHERE USERID = ?";
		ArrayList<userBetDTO> lists = new ArrayList<userBetDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userid.getUserID());
			rs= pstmt.executeQuery();
			while(rs.next()){
				userBetDTO user = new userBetDTO();
				user.setTeam(rs.getString(1));
				user.setWinScore(rs.getInt(2));
				user.setLoseScore(rs.getInt(3));
				lists.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DatabaseUtil.close(conn, pstmt, rs);
		}
		return lists;
	}
	
	public ArrayList<userBetDTO> getUsers(UserDTO id){
		String SQL="SELECT MATCHNO, WINSCORE, LOSESCORE, RESULT FROM USERBET WHERE USERID=? ORDER BY MATCHNO ASC";
		ArrayList<userBetDTO> list = new ArrayList<userBetDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, id.getUserID());
			rs= pstmt.executeQuery();
			while(rs.next()){
				userBetDTO user = new userBetDTO();
				user.setMatchNo(rs.getInt(1));
				user.setWinScore(rs.getInt(2));
				user.setLoseScore(rs.getInt(3));
				user.setResult(rs.getString(4));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DatabaseUtil.close(conn, pstmt, rs);
		}
		return list;
	}
}
