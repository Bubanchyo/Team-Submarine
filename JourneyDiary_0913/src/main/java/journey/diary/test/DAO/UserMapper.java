package journey.diary.test.DAO;

import journey.diary.test.VO.User;

public interface UserMapper {

	int checkEmail(String useremail);

	int registerMember(User member);

	User selectOne(User member);


}
