package userbet;

import user.UserDTO;

public class userBetDTO {
	static int no;
	int matchNo;
	String userID;
	String team;
	int winScore;
	int loseScore;
	String result;
	int point;
	public static int getNo() {
		return no;
	}
	public static void setNo(int no) {
		userBetDTO.no = no;
	}
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public int getWinScore() {
		return winScore;
	}
	public void setWinScore(int winScore) {
		this.winScore = winScore;
	}
	public int getLoseScore() {
		return loseScore;
	}
	public void setLoseScore(int loseScore) {
		this.loseScore = loseScore;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

}
