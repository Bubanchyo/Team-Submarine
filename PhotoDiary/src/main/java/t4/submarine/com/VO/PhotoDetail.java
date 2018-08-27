package t4.submarine.com.VO;

public class PhotoDetail {
	private int photono;
	private int albumno;
	private String content;
	private String imgsrc;
	private String regdate;
	private String privacy;
	private String lat;
	private String lng;

	public PhotoDetail() {
	}

	public PhotoDetail(int photono, int albumno, String content, String imgsrc, String regdate, String privacy,
			String lat, String lng) {
		super();
		this.photono = photono;
		this.albumno = albumno;
		this.content = content;
		this.imgsrc = imgsrc;
		this.regdate = regdate;
		this.privacy = privacy;
		this.lat = lat;
		this.lng = lng;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgsrc() {
		return imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
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

	@Override
	public String toString() {
		return "PhotoDetail [photono=" + photono + ", albumno=" + albumno + ", content=" + content + ", imgsrc="
				+ imgsrc + ", regdate=" + regdate + ", privacy=" + privacy + ", lat=" + lat + ", lng=" + lng + "]";
	}

}
