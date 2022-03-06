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
@Table(name = "likes")
public class Likes {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@ManyToOne
	@JoinColumn(name = "username")
	Users userL;

	@ManyToOne
	@JoinColumn(name = "videoId")
	Videos videoL;

	@Column(name = "isLike")
	Boolean like;

	@Column(name = "likeDate")
	Date likeDate;

	public Likes() {
		super();
	}

	public Likes(Long id, Users userL, Videos videoL, Boolean like, Date likeDate) {
		super();
		this.id = id;
		this.userL = userL;
		this.videoL = videoL;
		this.like = like;
		this.likeDate = likeDate;
	}

	public Likes(Users userL, Videos videoL, Boolean like, Date likeDate) {
		super();
		this.userL = userL;
		this.videoL = videoL;
		this.like = like;
		this.likeDate = likeDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUserL() {
		return userL;
	}

	public void setUserL(Users userL) {
		this.userL = userL;
	}

	public Videos getVideoL() {
		return videoL;
	}

	public void setVideoL(Videos videoL) {
		this.videoL = videoL;
	}

	public Boolean getLike() {
		return like;
	}

	public void setLike(Boolean like) {
		this.like = like;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

}
