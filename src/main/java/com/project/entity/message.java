package com.project.entity;

import java.util.Objects;

public class message {
	private String type;
	private String content;

	@Override
	public int hashCode() {
		return Objects.hash(content, type);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		message other = (message) obj;
		return Objects.equals(content, other.content) && Objects.equals(type, other.type);
	}

	@Override
	public String toString() {
		return "message [type=" + type + ", content=" + content + "]";
	}

	public message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public message(String type, String content) {
		super();
		this.type = type;
		this.content = content;
	}

}
