package com.thangnnc.entities;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "videos")
public class Videos {

	@Id
	@Column(name = "href")
	String href;

	@Column(name = "title")
	String title;

	@Column(name = "views")
	long views;

	@Column(name = "description")
	String description;

	@Column(name = "dateUpload")
	Timestamp dateUpload;

	@Column(name = "videoTime")
	String videoTime;

	@Column(name = "isActive")
	Boolean active = true;

	@OneToMany(mappedBy = "videoF")
	List<Favorites> favorites;

	@OneToMany(mappedBy = "videoL")
	List<Likes> likes;

	@OneToMany(mappedBy = "videoS")
	List<Shares> shares;

	@OneToMany(mappedBy = "videoC")
	List<Comments> comments;

	public Videos() {
		super();
	}

	public Videos(String href, String title, long views, String description, Timestamp dateUpload, Boolean active) {
		super();
		this.href = href;
		this.title = title;
		this.views = views;
		this.description = description;
		this.dateUpload = dateUpload;
		this.active = active;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getViews() {
		return views;
	}

	public void setViews(long views) {
		this.views = views;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getDateUpload() {
		return dateUpload;
	}

	public void setDateUpload(Timestamp dateUpload) {
		this.dateUpload = dateUpload;
	}

	public String getVideoTime() {
		return videoTime;
	}

	public void setVideoTime(String videoTime) {
		this.videoTime = videoTime;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<Favorites> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorites> favorites) {
		this.favorites = favorites;
	}

	public List<Likes> getLikes() {
		return likes;
	}

	public void setLikes(List<Likes> likes) {
		this.likes = likes;
	}

	public List<Shares> getShares() {
		return shares;
	}

	public void setShares(List<Shares> shares) {
		this.shares = shares;
	}

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

}
