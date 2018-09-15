package journey.diary.test.DAO;

import java.util.List;

import journey.diary.test.VO.Photo;

public interface PhotoMapper {
	public List<Photo> getPhotoList();
	public Photo getOnePhoto(int photono);
}
