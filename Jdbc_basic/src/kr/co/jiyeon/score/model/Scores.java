package kr.co.jiyeon.score.model;

/*
	CREATE TABLE scores (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT, -- 내가 데이터를 넣어주지 않아도 자동으로 숫자 증가
    name VARCHAR(45) NOT NULL,
    kor INT(10) DEFAULT 0,
    eng INT(10) DEFAULT 0,
    math INT(10) DEFAULT 0,
    total INT(20) NULL,
    average FLOAT(5,2) -- 최대자리수(소수점 포함 5), 소수점 이하 2자리
	);
 */

public class Scores {
	private Long id;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double average;
	
	public Scores() {}

	public Scores(Long id, String name, int kor, int eng, int math, int total, double average) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.total = total;
		this.average = average;
	}
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal() {
		this.total = this.kor + this.eng + this.math;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage() {
		this.average = this.total / 3.0;
	}
	
	
	
	
}
