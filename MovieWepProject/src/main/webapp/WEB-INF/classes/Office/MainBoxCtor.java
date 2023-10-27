package Office;

import java.util.List;

public class MainBoxCtor {
    private String rank;
    private String movieNm;
    private String openDt;
    private String posterUrl;
    private String movieDOCID;

    public String getMovieDOCID() {
		return movieDOCID;
	}

	public void setMovieDOCID(String DOCID) {
		this.movieDOCID = DOCID;
	}

	public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

   
    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getMovieNm() {
        return movieNm;
    }

    public void setMovieNm(String movieNm) {
        this.movieNm = movieNm;
    }

    public String getOpenDt() {
        return openDt;
    }

    public void setOpenDt(String openDt) {
        this.openDt = openDt;
    }
   
}
