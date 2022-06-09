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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Please provide a username.")
    @Size(min=3, max=30, message="Username must be atleast 3 characters.")
    private String userName;
    
    @NotEmpty(message="Email is a required field.")
    @Email(message="Please enter a valid email.")
    private String email;
    
    @NotEmpty(message="Please provide a password")
    @Size(min=8, max=100, message="Password must be atleast 8 characters.")
    private String password;
    
    @Transient
    @NotEmpty(message="Please confirm your password.")
    @Size(min=8, max=100, message="Password must be atleast 8 characters.")
    private String confirm;
    
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    //reviews user has created
    @OneToMany(mappedBy="reviewCreator", fetch=FetchType.LAZY)
	private List<Review> reviewsCreated;

    
    //alerts user has created
    @OneToMany(mappedBy="alertCreator", fetch=FetchType.LAZY)
	private List<Alert> alertsCreated;
    
    
    //comments user has posted
    @OneToMany(mappedBy="commentCreator", fetch=FetchType.LAZY)
	private List<Comment> commentsCreated;
    
    
    
    //reviews that user has liked
    @ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "users_reviews",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "review_id")
	)
    private List<Review> likedReviews;



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getConfirm() {
		return confirm;
	}



	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}



	public List<Review> getReviewsCreated() {
		return reviewsCreated;
	}



	public void setReviewsCreated(List<Review> reviewsCreated) {
		this.reviewsCreated = reviewsCreated;
	}



	public List<Alert> getAlertsCreated() {
		return alertsCreated;
	}



	public void setAlertsCreated(List<Alert> alertsCreated) {
		this.alertsCreated = alertsCreated;
	}



	public List<Comment> getCommentsCreated() {
		return commentsCreated;
	}



	public void setCommentsCreated(List<Comment> commentsCreated) {
		this.commentsCreated = commentsCreated;
	}



	public List<Review> getLikedReviews() {
		return likedReviews;
	}



	public void setLikedReviews(List<Review> likedReviews) {
		this.likedReviews = likedReviews;
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
