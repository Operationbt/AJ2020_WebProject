package dto;
/*
>>### userdata_tb
>>user_id char(20) not null : 유저 아이디를 저장
>>user_password char(20) not null : 유저 비밀번호를 저장
>>user_money int null : 기부에 필요한 재화를 저장
>>user_isAdmin tinyint null : 관리자 권한인지 판별. 0이면 일반 사용자, 1이면 관리자
 */
public class UserDataBean implements java.io.Serializable{
	private String id;
	private String password;
	private int money;
	private int isAdmin;
	
	//디폴트 생성자 필수
	public UserDataBean() {
		this(null, null, 0, 0);
	}

	public UserDataBean(String id, String password, int money, int isAdmin) {
		super();
		this.id = id;
		this.password = password;
		this.money = money;
		this.isAdmin = isAdmin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	@Override
	public String toString() {
		return "UserDataBean [id=" + id + ", password=" + password + ", money=" + money + ", isAdmin=" + isAdmin + "]";
	}
	
	
}
