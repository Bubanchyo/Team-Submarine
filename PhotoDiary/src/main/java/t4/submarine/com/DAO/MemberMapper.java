package t4.submarine.com.DAO;

import t4.submarine.com.VO.Album;
import t4.submarine.com.VO.Member;

public interface MemberMapper {

	Member registerCheck(String useremail);

	int checkEmail(String useremail);

	int registerMember(Member member);

	Member selectOne(Member member);

	int createAlbum(Album album);

}
