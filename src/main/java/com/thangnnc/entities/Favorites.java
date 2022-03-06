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
@Table(name = "favorites")
public class Favorites {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@ManyToOne  
	@JoinColumn(name = "username")
	Users userF;

	@ManyToOne  
	@JoinColumn(name = "videoId")
	Videos videoF;

	@Column(name = "favoriteDate")
	Date favoriteDate;

	public Favorites() {
		super();
	}

	public Favorites(Long id, Users userF, Videos videoF, Date favoriteDate) {
		super();
		this.id = id;
		this.userF = userF;
		this.videoF = videoF;
		this.favoriteDate = favoriteDate;
	}

	public Favorites(Users userF, Videos videoF, Date favoriteDate) {
		super();
		this.userF = userF;
		this.videoF = videoF;
		this.favoriteDate = favoriteDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUserF() {
		return userF;
	}

	public void setUserF(Users userF) {
		this.userF = userF;
	}

	public Videos getVideoF() {
		return videoF;
	}

	public void setVideoF(Videos videoF) {
		this.videoF = videoF;
	}

	public Date getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
	}

}
