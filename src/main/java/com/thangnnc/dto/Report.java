package com.thangnnc.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Report {

	@Id
	@Column(name = "href")
	String href;

	@Column(name = "title")
	String title;

	@Column(name = "favorites")
	Long favorites;

	@Column(name = "firstDate")
	Date firstDate;

	@Column(name = "lastDate")
	Date lastDate;

	public Report() {
		super();
	}

	public Report(String href, String title, Long favorites, Date firstDate, Date lastDate) {
		super();
		this.href = href;
		this.title = title;
		this.favorites = favorites;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
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

	public Long getFavorites() {
		return favorites;
	}

	public void setFavorites(Long favorites) {
		this.favorites = favorites;
	}

	public Date getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

}
