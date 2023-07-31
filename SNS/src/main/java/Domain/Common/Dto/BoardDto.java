package Domain.Common.Dto;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDto {
	private int number; // 게시물 번호
	private String id; // userid
	private String content; // 글내용
	private String date; // 작성날짜
	private int hits; // 조회수

//	디폴트 생성자
	public BoardDto() {
	}

	

//	모든 인자를 받는 생성자
	public BoardDto(int number, String id, String title, String content, String date, int hits) {
		this.number = number;
		this.id = id;
		this.content = content;
		this.date = date;
		this.hits = hits;
	}

//	toString 재정의
	@Override
	public String toString() {
		return "ContentsDto [number=" + number + ", id=" + id + "contents=" + content + ", date=" + date + ", hits="
				+ hits + "]";
	}

//	getter and setter
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

}