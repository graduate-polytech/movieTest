package DB;

public class Cinema {
	int no;
	String name;;
	String company;
	String address;
	String callno;
	String wep;

	public int getNo() {
		return no;
	}
	public Cinema(int no, String name, String company, String address, String callno, String wep) {
		super();
		this.no = no;
		this.name = name;
		this.company = company;
		this.address = address;
		this.callno = callno;
		this.wep = wep;
	}
	public Cinema() {
		this.no = 0;
		this.name = null;
		this.company = null;
		this.address = null;
		this.callno = null;
		this.wep = null;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCallno() {
		return callno;
	}
	public void setCallno(String callno) {
		this.callno = callno;
	}
	public String getWep() {
		return wep;
	}
	public void setWep(String wep) {
		this.wep = wep;
	}

}
