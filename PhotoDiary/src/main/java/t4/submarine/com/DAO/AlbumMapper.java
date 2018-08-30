package t4.submarine.com.DAO;

import java.util.ArrayList;
import java.util.Map;

import t4.submarine.com.VO.Album;
import t4.submarine.com.VO.Photo;

public interface AlbumMapper {

	ArrayList<Album> getAlbumList(int memberno);
	Album getAlbum(Map<String, Integer>data);
	ArrayList<Photo> getPhotoList(int albumno);

}
