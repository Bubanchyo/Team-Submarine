package journey.diary.test.DAO;

import java.util.List;

import journey.diary.test.VO.Photo;
import journey.diary.test.VO.Uploadimage;

public interface PhotoMapper {
	public List<Photo> getPhotoList();
	public List<Photo> getAlbumPhoto(int albumno);
	public Photo getOnePhoto(int photono);
	public int uploadimg(Uploadimage image);
}
