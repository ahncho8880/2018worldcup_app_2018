package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import userbet.userBetDTO;
import util.DatabaseUtil;

public class UserDAO {
	
	public int userjoin(UserDTO user){
		String SQL="INSERT INTO USER VALUES (?,?)";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, user.userID);
			pstmt.setString(2, user.userPassword);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{if(rs !=null)rs.close();}catch(Exception e){ e.printStackTrace();}
			try{if(pstmt !=null)pstmt.close();}catch(Exception e){ e.printStackTrace();}
			try{if(conn !=null)conn.close();}catch(Exception e){ e.printStackTrace();}
		}
		return -1;	//db����
	}
	
	
	public int login(String userID, String userPassword){
		String SQL="SELECT userPassword FROM USER WHERE userID=?";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs= pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;	//�α��� ����
				}
				else{
					return 0;	//��й�ȣ Ʋ��
				}
			}
			return -1;	//���̵� ����
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{if(rs !=null)rs.close();}catch(Exception e){ e.printStackTrace();}
			try{if(pstmt !=null)pstmt.close();}catch(Exception e){ e.printStackTrace();}
			try{if(conn !=null)conn.close();}catch(Exception e){ e.printStackTrace();}
		}
		return -2;	//db����
	}
	
	public int join(String userID, String userPassword){
		String SQL ="INSERT INTO USER VALUES (?,?)";
		try{
			Connection conn =DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<UserDTO> getUserid(){
		String SQL="SELECT USERID FROM USER";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()){
				UserDTO user = new UserDTO();
				user.setUserID(rs.getString(1));
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
