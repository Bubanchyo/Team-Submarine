package t4.submarine.com.VO;

public class Album {
	private int albumno;
	private int memberno;
	private String title;
	private String thumbnail;

	public Album() {
	}

	public Album(int albumno, int memberno, String title, String thumbnail) {
		super();
		this.albumno = albumno;
		this.memberno = memberno;
		this.title = title;
		this.thumbnail = thumbnail;
	}

	public int getAlbumno() {
		return albumno;
	}

	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "Album [albumno=" + albumno + ", memberno=" + memberno + ", title=" + title + ", thumbnail=" + thumbnail
				+ "]";
	}

}
