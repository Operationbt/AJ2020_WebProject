package dto;

public class UserDataBean implements java.io.Serializable{
	private String id;
	private String password;
	private int money;
	private int scheduledMoney;
	private int isAdmin;
	
	
	public UserDataBean() {
		this(null, null, 0, 0,0);
	}

	public UserDataBean(String id, String password, int money,int scheduledMoney, int isAdmin) {
		super();
		this.id = id;
		this.password = password;
		this.money = money;
		this.scheduledMoney=scheduledMoney;
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

	@Override
	public String toString() {
		return "UserDataBean [id=" + id + ", password=" + password + ", money=" + money + ", scheduledMoney="
				+ scheduledMoney + ", isAdmin=" + isAdmin + "]";
	}
	
	
	
	
}
