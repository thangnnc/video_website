package com.thangnnc.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Users {

	@Id
	@Column(name = "username")
	String username;

	@Column(name = "password")
	String password;

	@Column(name = "fullname")
	String fullname;

	@Column(name = "email")
	String email;

	@Column(name = "isAdmin")
	boolean admin;

	@Column(name = "isActive")
	boolean active;

	@Column(name = "image")
	String image;

	@OneToMany(mappedBy = "userF")
	List<Favorites> favorites;

	@OneToMany(mappedBy = "userL")
	List<Likes> likes;

	@OneToMany(mappedBy = "userS")
	List<Shares> shares;

	@OneToMany(mappedBy = "userH")
	List<Histories> histories;
	
	@OneToMany(mappedBy = "userC")
	List<Comments> comments;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
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

	public List<Histories> getHistories() {
		return histories;
	}

	public void setHistories(List<Histories> histories) {
		this.histories = histories;
	}

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

}
