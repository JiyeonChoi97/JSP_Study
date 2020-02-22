package user;
//list 제작

import java.util.ArrayList;
import java.util.List;

public class UserRepository {
	
	private static List<User> userList = new ArrayList<>();
	
	// 회원의 정보를 리스트에 저장하는 메서드
	public static void save(User user) {
		userList.add(user);
	}
	
	// 리스트에 담긴 회원 정보를 모두 열람하는 메서드
	public static void showUsers() {
		System.out.println("### 회원 정보 ###");
		
		for(User user : userList) {
			System.out.println("아이디 : " + user.getAccount());
			System.out.println("비밀번호 : " + user.getPassword());
			System.out.println("이름 : " + user.getName());
			System.out.println("별명 : " + user.getNickName());
			System.out.println("===========================");
		}
	}
	
	// 계정명을 통해 해당 계정명의 정보를 가지고 있는 User 객체를 리턴하는 메서드
	public static User getUser(String inputId) {
		for(User user : userList) {
			if(user.getAccount().equals(inputId)) {
				return user;
			}			
		}
		return null;

	}
	
	//회원 정보를 리스트에서 삭제
	public static void deleteUser(String account) {
		// getUser를 불러서 사용
		userList.remove(getUser(account));
		
		
	}
	
	
	
	
	
	
}
