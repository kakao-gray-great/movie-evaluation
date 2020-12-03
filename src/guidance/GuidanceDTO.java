package guidance;

public class GuidanceDTO {
	private int descriptionID;
	private String descriptionTitle;
	private String descriptionContent;
	private String descriptionImage;
	
	public GuidanceDTO(int descriptionID, String descriptionTitle, String descriptionContent, String descriptionImage) {
		super();
		this.descriptionID = descriptionID;
		this.descriptionTitle = descriptionTitle;
		this.descriptionContent = descriptionContent;
		this.descriptionImage = descriptionImage;
	}
	
	public int getDescriptionID() {
		return descriptionID;
	}
	
	public void setDescriptionID(int descriptionID) {
		this.descriptionID = descriptionID;
	}

	public String getDescriptionTitle() {
		return descriptionTitle;
	}
	
	public void setDescriptionTitle(String descriptionTitle) {
		this.descriptionTitle = descriptionTitle;
	}
	
	public String getDescriptionContent() {
		return descriptionContent;
	}
	
	public void setDescriptionContent(String descriptionContent) {
		this.descriptionContent = descriptionContent;
	}
	
	public String getDescriptionImage() {
		return descriptionImage;
	}
	
	public void setDescriptionImage(String descriptionImage) {
		this.descriptionImage = descriptionImage;
	}
	
	
}
