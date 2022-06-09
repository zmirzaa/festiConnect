package com.zainab.festival.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="alerts")
public class Alert {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Please provide festival name.")
	private String festivalName;
	
	@NotEmpty(message="Please provide ig username. This is how festies will find you.")
	private String igHandle;
	
	@NotEmpty(message="Please provide details. This will help get you noticed!")
	@Size(min=5, max=200, message="Description must be atleast 5 characters.")
	private String description; 
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User alertCreator;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getFestivalName() {
		return festivalName;
	}


	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}


	public String getIgHandle() {
		return igHandle;
	}


	public void setIgHandle(String igHandle) {
		this.igHandle = igHandle;
	}


	public String getDesc() {
		return description;
	}


	public void setDesc(String desc) {
		this.description = desc;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public User getAlertCreator() {
		return alertCreator;
	}


	public void setAlertCreator(User alertCreator) {
		this.alertCreator = alertCreator;
	}
    
    

}
