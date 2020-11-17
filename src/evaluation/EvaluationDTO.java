package evaluation;

public class EvaluationDTO {
	
	private int evaluationID;
	private String userID;
	private String movieTitle;
	private String directorName;
	private String genre;
	private String evaluationTitle;
	private String evaluationContent;
	private int totalScore;
	private int storyScore;
	private int videoScore;
	private int characterScore;
	private int likeCount;
	
	public EvaluationDTO(int evaluationID, String userID, String movieTitle, String directorName, String genre,
			String evaluationTitle, String evaluationContent, int totalScore, int storyScore, int videoScore,
			int characterScore, int likeCount) {
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.movieTitle = movieTitle;
		this.directorName = directorName;
		this.genre = genre;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.storyScore = storyScore;
		this.videoScore = videoScore;
		this.characterScore = characterScore;
		this.likeCount = likeCount;
	}

	public int getEvaluationID() {
		return evaluationID;
	}

	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
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

	public String getEvaluationTitle() {
		return evaluationTitle;
	}

	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}

	public String getEvaluationContent() {
		return evaluationContent;
	}

	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public int getStoryScore() {
		return storyScore;
	}

	public void setStoryScore(int storyScore) {
		this.storyScore = storyScore;
	}

	public int getVideoScore() {
		return videoScore;
	}

	public void setVideoScore(int videoScore) {
		this.videoScore = videoScore;
	}

	public int getCharacterScore() {
		return characterScore;
	}

	public void setCharacterScore(int characterScore) {
		this.characterScore = characterScore;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
