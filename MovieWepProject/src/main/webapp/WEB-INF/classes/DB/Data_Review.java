package DB;

import java.util.Date;

public class Data_Review {
	int no = 0;
	String userid = "";
	String title = "";
	String director = "";
	int score = 0;
	String review = "";
	
	public Data_Review() {
	}
	
	public Data_Review(String no, String userid, String title, String director, String score, String review) {
		super();
		try {
			this.no = Integer.parseInt(no);
		} catch(Exception e) {
			this.no = -1;
		}
		this.userid = userid;
		this.title = title;
		this.director = director;
		this.score = Integer.parseInt(score);
		this.review = review;
	}

	Date date = new Date();

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getScore() {
		System.out.println("getScore : " + score);
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Data_Review [userid=" + userid + ", title=" + title + ", director=" + director + ", score=" + score
				+ ", review=" + review + ", date=" + date + "]";
	}

}
