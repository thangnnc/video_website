package com.thangnnc.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shares")
public class Shares {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@ManyToOne  
	@JoinColumn(name = "username")
	Users userS;

	@ManyToOne  
	@JoinColumn(name = "videoId")
	Videos videoS;

	@Column(name = "emails")
	String email;
	
	@Column(name = "shareDate")
	Date shareDate;

	public Shares() {
		super();
	}

	public Shares(Users userS, Videos videoS, String email, Date shareDate) {
		super();
		this.userS = userS;
		this.videoS = videoS;
		this.email = email;
		this.shareDate = shareDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUserS() {
		return userS;
	}

	public void setUserS(Users userS) {
		this.userS = userS;
	}

	public Videos getVideoS() {
		return videoS;
	}

	public void setVideoS(Videos videoS) {
		this.videoS = videoS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getShareDate() {
		return shareDate;
	}

	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}

}
