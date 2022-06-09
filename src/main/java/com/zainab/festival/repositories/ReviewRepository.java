package com.zainab.festival.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zainab.festival.models.Review;


@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>  {
	
	List<Review> findAll(); 

}
