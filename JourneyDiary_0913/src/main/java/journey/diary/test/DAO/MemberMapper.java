package journey.diary.test.DAO;

import journey.diary.test.VO.Member;

public interface MemberMapper {

	int checkEmail(String useremail);

	int registerMember(Member member);

	Member selectOne(Member member);


}
