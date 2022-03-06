package com.thangnnc.entities;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "histories_login")
public class Histories {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@ManyToOne
	@JoinColumn(name = "username")
	Users userH;

	@ManyToOne
	@JoinColumn(name = "videoId")
	Videos videoH;

	@Basic
	Timestamp loginDate = new Timestamp(new Date().getTime());

	String loginPage;

	public Histories() {
		super();
	}

	public Histories(Users userH, Videos videoH, Timestamp loginDate, String loginPage) {
		super();
		this.userH = userH;
		this.videoH = videoH;
		this.loginDate = loginDate;
		this.loginPage = loginPage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUserH() {
		return userH;
	}

	public void setUserH(Users userH) {
		this.userH = userH;
	}

	public Timestamp getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Timestamp loginDate) {
		this.loginDate = loginDate;
	}

	public String getLoginPage() {
		return loginPage;
	}

	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}

	public Videos getVideoH() {
		return videoH;
	}

	public void setVideoH(Videos videoH) {
		this.videoH = videoH;
	}

}
