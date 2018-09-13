package journey.diary.test.VO;

public class Album {
	private int albumno;
	private String albumtitle;
	private String albumintro;
	private String albumimg;
	private String startdate;
	private String enddate;
	private int memberno;
	
	public Album() {
		
	}

	public int getAlbumno() {
		return albumno;
	}

	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}

	public String getAlbumtitle() {
		return albumtitle;
	}

	public void setAlbumtitle(String albumtitle) {
		this.albumtitle = albumtitle;
	}

	public String getAlbumintro() {
		return albumintro;
	}

	public void setAlbumintro(String albumintro) {
		this.albumintro = albumintro;
	}

	public String getAlbumimg() {
		return albumimg;
	}

	public void setAlbumimg(String albumimg) {
		this.albumimg = albumimg;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	@Override
	public String toString() {
		return "Album [albumno=" + albumno + ", albumtitle=" + albumtitle + ", albumintro=" + albumintro + ", albumimg="
				+ albumimg + ", startdate=" + startdate + ", enddate=" + enddate + ", memberno=" + memberno + "]";
	}
	
	
}
