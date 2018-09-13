package journey.diary.test.VO;

public class Photo {
	private int photono;
	private int albumno;
	private String privacy;
	private String photoimg;
	private String photocontent;
	private String keyword;
	private String dateoftravel;
	private String lat;
	private String lng;
	private int memberno;

	public Photo() {
	}

	public int getPhotono() {
		return photono;
	}

	public void setPhotono(int photono) {
		this.photono = photono;
	}

	public int getAlbumno() {
		return albumno;
	}

	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getPhotoimg() {
		return photoimg;
	}

	public void setPhotoimg(String photoimg) {
		this.photoimg = photoimg;
	}

	public String getPhotocontent() {
		return photocontent;
	}

	public void setPhotocontent(String photocontent) {
		this.photocontent = photocontent;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDateoftravel() {
		return dateoftravel;
	}

	public void setDateoftravel(String dateoftravel) {
		this.dateoftravel = dateoftravel;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	@Override
	public String toString() {
		return "Photo [photono=" + photono + ", albumno=" + albumno + ", privacy=" + privacy + ", photoimg=" + photoimg
				+ ", photocontent=" + photocontent + ", keyword=" + keyword + ", dateoftravel=" + dateoftravel
				+ ", lat=" + lat + ", lng=" + lng + ", memberno=" + memberno + "]";
	}

	
	
}


