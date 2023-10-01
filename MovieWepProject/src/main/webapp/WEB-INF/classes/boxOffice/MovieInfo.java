package boxOffice;

import java.util.List;

public class MovieInfo {
    private String movieTitle;
    private String directorName;
    private String nation;
    private List<String> posters;

    public MovieInfo(String movieTitle, String directorName, String nation) {
        this.movieTitle = movieTitle;
        this.directorName = directorName;
        this.nation = nation;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getDirectorName() {
        return directorName;
    }

    public void setDirectorName(String directorName) {
        this.directorName = directorName;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public List<String> getPosters() {
        return posters;
    }

    public void setPosters(List<String> posters) {
        this.posters = posters;
    }

}

