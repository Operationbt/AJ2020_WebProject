package dto;

import java.sql.Date;

/*
>>### userdata_tb
>>user_id char(20) not null : 유저 아이디를 저장
>>user_password char(20) not null : 유저 비밀번호를 저장
>>user_money int 0 : 기부에 필요한 재화를 저장
>>user_isAdmin tinyint 0 : 관리자 권한인지 판별. 0이면 일반 사용자, 1이면 관리자
>>user_name varchar(45) null : 유저 이름
>>user_email varchar(45) null : 유저 이메일
>>user_phone varchar(45) null : 유저 전화번호
>>user_date DATE null : 회원가입 날짜
 */

public class UserDataBean implements java.io.Serializable{
	private String id;
	private String password;
	private int money;
	private int scheduledMoney;
	private int isAdmin;
	private String name;
	private String email;
	private String phone;
	private Date registerDate;
	
	
	public UserDataBean() {
		this(null, null, 0, 0, 0, null, null, null, null);
	}
	
	//회원가입시 입력하는 파라미터들로만 생성
	public UserDataBean(String id, String password, String name, String email, String phone) {
		this();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public UserDataBean(String id, String password, int money, int scheduledMoney, int isAdmin) {
		this();
		this.id = id;
		this.password = password;
		this.money = money;
		this.scheduledMoney = scheduledMoney;
		this.isAdmin = isAdmin;
	}

	public UserDataBean(String id, String password, int money, int scheduledMoney, int isAdmin, String name, String email, String phone,
			Date registerDate) {
		super();
		this.id = id;
		this.password = password;
		this.money = money;
		this.scheduledMoney = scheduledMoney;
		this.isAdmin = isAdmin;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.registerDate = registerDate;
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

	public int getScheduledMoney() {
		return scheduledMoney;
	}

	public void setScheduledMoney(int scheduledMoney) {
		this.scheduledMoney = scheduledMoney;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@Override
	public String toString() {
		return "UserDataBean [id=" + id + ", password=" + password + ", money=" + money + ", scheduledMoney="
				+ scheduledMoney + ", isAdmin=" + isAdmin + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", registerDate=" + registerDate + "]";
	}
}
