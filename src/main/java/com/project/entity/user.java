package com.project.entity;

import java.util.Objects;

import javax.persistence.*;

@Entity
public class user {
	@Id
	private String userid;
	private String password;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public user(String userid, String password) {
		super();
		this.userid = userid;
		this.password = password;
	}

	@Override
	public String toString() {
		return "admin [userid=" + userid + ", password=" + password + "]";
	}

	public user() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		return Objects.hash(password, userid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		user other = (user) obj;
		return Objects.equals(password, other.password) && Objects.equals(userid, other.userid);
	}

}
