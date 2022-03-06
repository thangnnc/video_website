package com.thangnnc.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Report2 {

	@Id
	@Column(name = "username")
	String username;

	@Column(name = "fullname")
	String fullname;

	@Column(name = "email")
	String email;

	@Column(name = "favoriteDate")
	Date favoriteDate;

	@Column(name = "admin")
	Boolean admin;

	public Report2() {
		super();
	}

	public Report2(String username, String fullname, String email, Date favoriteDate, Boolean admin) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.favoriteDate = favoriteDate;
		this.admin = admin;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}


}
