package DB;

public class userData {
	private String id;
	private String pw;
	private String name;
	private String birthday;
	private String email;
	private String address;	
	private String genre;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String date) {
		this.birthday = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public userData(String id, String pw, String name, String birthday, String email, String address, String genre1, String genre2, String genre3, String genre4) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
		this.genre = genre1 + "|" + genre2 + "|" + genre3 + "|" + genre4;
	}


}
