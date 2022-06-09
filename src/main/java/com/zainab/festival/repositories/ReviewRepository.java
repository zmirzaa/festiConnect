package com.zainab.festival.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.zainab.festival.models.Review;

public interface ReviewRepository extends CrudRepository<Review, Long>  {
	
	List<Review> findAll(); 

}
