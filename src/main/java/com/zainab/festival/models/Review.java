package com.zainab.festival.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="reviews")
public class Review {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull 
	@Size(min=3, max=200, message="Festival name must be at least 3 characters.")
	private String festivalName;
	
	
	@NotEmpty(message="Please provide year attended.")
	@DateTimeFormat(pattern="yyyy")
	private Date year; 
	
	@NotNull
	@Size(min=8, max=200, message="Description must be at least 10 characters long.")
	private String description; 
	
	@NotEmpty(message="Please provide rating.")
	private int rating; 

	@NotNull
	private String tips; 
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    
    
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User reviewCreator;
	
    
    
    @OneToMany(mappedBy="reviewComment", fetch = FetchType.LAZY)
    private List<Comment> comments; 
    
    
    
    @ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "users_reviews",
			joinColumns = @JoinColumn(name = "review_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
	)
    private List<User> likers; 



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



	public Date getYear() {
		return year;
	}



	public void setYear(Date year) {
		this.year = year;
	}



	public String getDesc() {
		return description;
	}



	public void setDesc(String desc) {
		this.description = desc;
	}



	public int getRating() {
		return rating;
	}



	public void setRating(int rating) {
		this.rating = rating;
	}



	public String getTips() {
		return tips;
	}



	public void setTips(String tips) {
		this.tips = tips;
	}



	public User getReviewCreator() {
		return reviewCreator;
	}



	public void setReviewCreator(User reviewCreator) {
		this.reviewCreator = reviewCreator;
	}



	public List<Comment> getComments() {
		return comments;
	}



	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}



	public List<User> getLikers() {
		return likers;
	}



	public void setLikers(List<User> likers) {
		this.likers = likers;
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
    
    
    
    
    
	
	
	
	
	
	

}
