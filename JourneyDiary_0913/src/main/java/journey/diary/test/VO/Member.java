package journey.diary.test.VO;

public class Member {
	private int memberno;
	private String useremail;
	private String username;
	private String userpassword;
	private String regdate;
	private String logdate;
	private String approvalstatus;
	private int approvalkey;
	private String nickname;
	private String gender;

	public Member() {
	}

	public Member(int memberno, String useremail, String username, String userpassword, String regdate, String logdate,
			String approvalstatus, int approvalkey, String nickname, String gender) {
		super();
		this.memberno = memberno;
		this.useremail = useremail;
		this.username = username;
		this.userpassword = userpassword;
		this.regdate = regdate;
		this.logdate = logdate;
		this.approvalstatus = approvalstatus;
		this.approvalkey = approvalkey;
		this.nickname = nickname;
		this.gender = gender;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLogdate() {
		return logdate;
	}

	public void setLogdate(String logdate) {
		this.logdate = logdate;
	}

	public String getApprovalstatus() {
		return approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
	}

	public int getApprovalkey() {
		return approvalkey;
	}

	public void setApprovalkey(int approvalkey) {
		this.approvalkey = approvalkey;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [memberno=" + memberno + ", useremail=" + useremail + ", username=" + username
				+ ", userpassword=" + userpassword + ", regdate=" + regdate + ", logdate=" + logdate
				+ ", approvalstatus=" + approvalstatus + ", approvalkey=" + approvalkey + ", nickname=" + nickname
				+ ", gender=" + gender + "]";
	}

}
