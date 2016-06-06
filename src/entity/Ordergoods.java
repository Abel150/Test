package entity;

public class Ordergoods {
	private String username;
	private int pid;
	private String  ownername;
	private int pnum;
	private String pic;

	
	public Ordergoods() {
		super();
	}

	public Ordergoods(String userName, int pID, String ownerName,int pNUM,String Pic) {
		super();
		this.username = userName;
		this.pid = pID;
		this.ownername = ownerName;
		this.pnum= pNUM;
		this.pic=Pic;
		
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public int getPID() {
		return pid;
	}

	public void setPID(int pID) {
		this.pid = pID;
	}

	public String getOwnerName() {
		return ownername;
	}

	public void setOwnerName(String OwnerName) {
		this.ownername = OwnerName;
	}

	public int getpNUM() {
		return pnum;
	}

	public void setpNUM(int pNUM) {
		this.pnum = pNUM;
	}
	
	public String getPic() {
		return pic;
	}

	public void setPic(String Pic) {
		this.pic =Pic;
	}

}
