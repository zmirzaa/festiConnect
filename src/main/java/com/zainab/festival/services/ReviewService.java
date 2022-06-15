package com.zainab.festival.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.zainab.festival.models.Comment;
import com.zainab.festival.models.Review;
import com.zainab.festival.models.User;
import com.zainab.festival.repositories.CommentRepository;
import com.zainab.festival.repositories.ReviewRepository;

@Service
public class ReviewService {
	  
	@Autowired
	private ReviewRepository rRepo; 
	
	@Autowired
	private CommentRepository cRepo; 
	
	
	public List<Review> allReviews() {
		return rRepo.findAll(); 
		
	}
	
	public Review createReview(Review review) {
		return rRepo.save(review); 
	}
	
	
	public void delete(Long id) {
		rRepo.deleteById(id);
	}
	
	public Review getOneReview(Long id) {
		return rRepo.findById(id).orElse(null); 
	}
	
	public Review update(Review review) {
		return rRepo.save(review); 
	}
	
	
	//like review 
	public void like(Review review, User user) {
		List<User> likers=review.getLikers(); 
		likers.add(user); 
		rRepo.save(review); 
		
	}
	 
	
	//add a comment 
	public void addComment(Comment comment) {
		cRepo.save(comment); 
	}
	
	
	public List<Review> findByFestivalName(String festivalName) {
		return rRepo.findByFestivalNameContaining(festivalName);
	}
	
	
	
	
}