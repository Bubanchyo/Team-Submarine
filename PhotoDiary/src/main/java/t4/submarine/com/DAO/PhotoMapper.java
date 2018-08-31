package t4.submarine.com.DAO;

import t4.submarine.com.VO.Image;
import t4.submarine.com.VO.Photo;

public interface PhotoMapper {

	public Photo selectOnePhoto(int photono);
	public int ajaxUpload(Photo photo);
	public int uploadimg(Image image);

}
