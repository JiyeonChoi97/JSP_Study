package kr.co.jiyeon.jspbasic.user;

public class UserBean {
	/*
	 # 자바 빈
	 
	 1. 자바 빈은 데이터베이스와이ㅡ 반복 데이터 작업을 쉽게 처리하기 위한 클래스입니다.
	  
	 2. 일반적으로 데이터베이스의 컬럼과 1:1로 매칭되는 멤버변수(필드)를 선언합니다.
	 
	 3. 자바빈 클래스는 은닉(캡술화)을 사용하여 데이터를 보호합니다.
	 */
	
	private String id;
	private String pw;
	private String name;
	private String email;
	
	/*
	 - 자바 빈 클래스는 일반적으로 기본생성자 1개(필수)와 모든 멤버변수를 초기화하는 생성자(선택)를 1개 선언합니다. 
	 */
	public UserBean() {}

	// 모든 생성자 초기화 Alt+Ctrl+s -> Generate COnstructor using fields
	public UserBean(String id, String pw, String name, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
	}

	// 모든 생성자 초기화 Alt+Ctrl+s -> Generate getter and setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
	
	
}
