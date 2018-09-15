package journey.diary.test.DAO;

import journey.diary.test.VO.Member;

public interface MemberMapper {

	public int checkEmail(String useremail);

	public int registerMember(Member member);

	public Member selectOne(Member member);


}
