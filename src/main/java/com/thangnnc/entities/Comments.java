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
@Table(name = "comments")
public class Comments {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@ManyToOne
	@JoinColumn(name = "username")
	Users userC;

	@ManyToOne
	@JoinColumn(name = "videoId")
	Videos videoC;

	@Column(name = "comment")
	String comment;

	@Column(name = "commentDate")
	Date commentDate;

	public Comments() {
		super();
	}

	public Comments(Users userC, Videos videoC, String comment, Date commentDate) {
		super();
		this.userC = userC;
		this.videoC = videoC;
		this.comment = comment;
		this.commentDate = commentDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUserC() {
		return userC;
	}

	public void setUserC(Users userC) {
		this.userC = userC;
	}

	public Videos getVideoC() {
		return videoC;
	}

	public void setVideoC(Videos videoC) {
		this.videoC = videoC;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
}
