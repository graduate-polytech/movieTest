package DB;

import java.util.Date;

public class Data_Review {
	String userid = "";
	String title = "";
	String director = "";
	int score = 0;
	String review = "";
	Date date = new Date();

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
