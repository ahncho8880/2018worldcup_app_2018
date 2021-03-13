package answer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import nowuserpoint.UserPointDTO;
import userbet.userBetDTO;
import util.DatabaseUtil;

public class answerDAO {
	
	//UPDATE
	public int uploadAnswer(int winscore, int losescore, String result){
		String SQL ="INSERT INTO ANSWER(WINSCORE, LOSESCORE, RESULT) VALUES(?,?,?)";
		try{
			Connection conn =DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, winscore);
			pstmt.setInt(2, losescore);
			pstmt.setString(3, result);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
public ArrayList<answerDTO> getAnswer(){
		
		String SQL="SELECT NO, WINSCORE, LOSESCORE, RESULT FROM ANSWER ORDER BY NO ASC";
		ArrayList<answerDTO> list = new ArrayList<answerDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()){
				answerDTO ans = new answerDTO();
				ans.setNo(rs.getInt(1));
				ans.setWinscore(rs.getInt(2));
				ans.setLosescore(rs.getInt(3));
				ans.setResult(rs.getString(4));
				list.add(ans);
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
