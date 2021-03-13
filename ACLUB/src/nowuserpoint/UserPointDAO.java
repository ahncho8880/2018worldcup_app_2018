package nowuserpoint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import user.UserDTO;
import userbet.userBetDTO;
import userscore.userScoreDTO;
import util.DatabaseUtil;

public class UserPointDAO {
	
	public int setTotalScore(userScoreDTO sum){
		String SQL ="UPDATE USERPOINT SET TOTALPOINT=? WHERE USERID=?";
		
		try{
			Connection conn =DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, sum.getSum());
			pstmt.setString(2, sum.getUserID());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<UserPointDTO> getuserinfo (){
		String SQL="SELECT USERID,TOTALPOINT FROM USERPOINT ORDER BY TOTALPOINT DESC";
		ArrayList<UserPointDTO> list = new ArrayList<UserPointDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()){
				UserPointDTO user = new UserPointDTO();
				user.setUserID(rs.getString(1));
				user.setTotalPoint(rs.getInt(2));
				list.add(user);
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
