package kr.co.jiyeon.user.model;

public interface IUserDAO {

	
	// 중복 ID 여부를 검증하는 메서드
	boolean confirmID(String id);
	
	// 회원 가입을 처리하는 메서드
	boolean insertUser(UserVO vo);
	
	// 로그인 유효성을 검증하는 메서드
	int userCheck(String id, String pw);
	
	// 모든 회원 정보를 얻어오는 메서드
	UserVO getUserInfo(String id);
	
	// 비밀번호 변경메서드
	boolean changePassword(String id, String pw);
	
	// 회원정보를 수정하는 메서드
	boolean updateUser(UserVO vo);
	
	// 회원 탈퇴 메서드
	boolean deleteUser(String id);
}
