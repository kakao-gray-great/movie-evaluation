package movie;

public class MovieDTO {
	
	private int movieID;
	private String movieTitle;
	private String directorName;
	private String genre;
	private String imageLink;
	
	public MovieDTO(int movieID, String movieTitle, String directorName, String genre, String imageLink) {
		super();
		this.movieID = movieID;
		this.movieTitle = movieTitle;
		this.directorName = directorName;
		this.genre = genre;
		this.imageLink = imageLink;
	}
	
	public int getMovieID() {
		return movieID;
	}
	
	public void setMovieID(int movieID) {
		this.movieID = movieID;
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
	
	public String getGenre() {
		return genre;
	}
	
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getImageLink() {
		return imageLink;
	}
	
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
		
}
