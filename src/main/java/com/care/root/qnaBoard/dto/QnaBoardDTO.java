package com.care.root.qnaBoard.dto;


import java.text.SimpleDateFormat;

public class QnaBoardDTO {
	private int num;
	private String title;
	private String content;
	private String days;
	private int hit;
	private String id;
	private String request;
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDays() {
		return days;
	}
	/*
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}*/
	public void setDays(java.sql.Timestamp days) {
		SimpleDateFormat fo = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.days = fo.format(days);
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
