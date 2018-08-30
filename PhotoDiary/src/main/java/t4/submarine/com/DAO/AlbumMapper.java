package t4.submarine.com.DAO;

import java.util.ArrayList;

import t4.submarine.com.VO.Album;

public interface AlbumMapper {

	ArrayList<Album> getAlbumList(int memberno);

}
