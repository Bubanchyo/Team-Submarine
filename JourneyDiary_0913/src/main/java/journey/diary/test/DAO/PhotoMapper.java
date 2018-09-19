package journey.diary.test.DAO;

import java.util.List;

import journey.diary.test.VO.Photo;
import journey.diary.test.VO.Uploadimage;

public interface PhotoMapper {
	public List<Photo> getPhotoList();
	public List<Photo> getAlbumPhoto(int albumno);
	public Photo selectOnePhoto(int photono);
	public int photoUpload(Photo photo);
	public int uploadimg(Uploadimage image);
	public int alterPhoto(Photo photo);
	public int deletePhoto(int photono);
	public List<Photo> getBestPhotos();
	public int hitCount(int photono);
	public int likeCount(int photono);
}
