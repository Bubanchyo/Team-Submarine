package t4.submarine.com.VO;

/*
 * 임시 VO 
 * */

public class Image {
	private int imgseq;
	private String originalfilename;
	private String savedfilename;

	public Image() {
	}

	public Image(int imgseq, String originalfilename, String savedfilename) {
		super();
		this.imgseq = imgseq;
		this.originalfilename = originalfilename;
		this.savedfilename = savedfilename;
	}

	public int getImgseq() {
		return imgseq;
	}

	public void setImgseq(int imgseq) {
		this.imgseq = imgseq;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	public String getSavedfilename() {
		return savedfilename;
	}

	public void setSavedfilename(String savedfilename) {
		this.savedfilename = savedfilename;
	}

	@Override
	public String toString() {
		return "Image [imgseq=" + imgseq + ", originalfilename=" + originalfilename + ", savedfilename=" + savedfilename
				+ "]";
	}

}
