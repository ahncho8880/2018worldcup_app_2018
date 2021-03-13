package answerTeam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import answer.answerDTO;
import util.DatabaseUtil;

public class teamDAO {
	public int setTeam(String home, String away){
		String SQL ="INSERT INTO ANSWERTEAM(HOME, AWAY) VALUES(?,?)";
		try{
			Connection conn =DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, home);
			pstmt.setString(2, away);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<teamDTO> getTeam(){
		String SQL="SELECT HOME, AWAY, NO FROM ANSWERTEAM";
		ArrayList<teamDTO> list = new ArrayList<teamDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()){
				teamDTO team = new teamDTO();
				team.setHome(rs.getString(1));
				team.setAway(rs.getString(2));
				team.setNo(rs.getInt(3));
				list.add(team);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{if(rs !=null)rs.close();}catch(Exception e){ e.printStackTrace();}
			try{if(pstmt !=null)pstmt.close();}catch(Exception e){ e.printStackTrace();}
			try{if(conn !=null)conn.close();}catch(Exception e){ e.printStackTrace();}
		}
		return list;
	}
}
