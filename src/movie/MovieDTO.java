package movie;

public class MovieDTO {
	
	private int movieID;
	private String movieTitle;
	private String directorName;
	private String genre;
	private String fileName;
	
	public MovieDTO(int movieID, String movieTitle, String directorName, String genre, String fileName) {
		super();
		this.movieID = movieID;
		this.movieTitle = movieTitle;
		this.directorName = directorName;
		this.genre = genre;
		this.fileName = fileName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
