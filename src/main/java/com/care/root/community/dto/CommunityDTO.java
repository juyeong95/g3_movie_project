package com.care.root.community.dto;

import java.text.SimpleDateFormat;

public class CommunityDTO {
	private int num;
	private String id;
	private String title;
	private String content;
	private int groups;
	private int step;
	private int indent;
	private int hit;
	private String times;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getGroups() {
		return groups;
	}
	public void setGroups(int groups) {
		this.groups = groups;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(java.sql.Timestamp times) {
		SimpleDateFormat fo = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.times = fo.format(times);
	}
	
	
}