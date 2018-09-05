package t4.submarine.com.DAO;

import t4.submarine.com.VO.Photo;
import t4.submarine.com.VO.Uploadimage;

public interface PhotoMapper {

	public Photo selectOnePhoto(int photono);
	public int ajaxUpload(Photo photo);
	public int photoUpload(Photo photo);
	public int uploadimg(Uploadimage image);
	public int deletePhoto(int photonum);
}
