package answer;

public class answerDTO {
	int no;
	String home;
	String away;
	int winscore;
	int losescore;
	String result;
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String winteam) {
		this.home = away;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String winteam) {
		this.home = winteam;
	}
	public int getWinscore() {
		return winscore;
	}
	public void setWinscore(int winscore) {
		this.winscore = winscore;
	}
	public int getLosescore() {
		return losescore;
	}
	public void setLosescore(int losescore) {
		this.losescore = losescore;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
