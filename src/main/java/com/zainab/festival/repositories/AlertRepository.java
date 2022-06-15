package com.zainab.festival.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zainab.festival.models.Alert;

@Repository
public interface AlertRepository extends CrudRepository<Alert, Long>  {
	List<Alert> findAll(); 
	List<Alert> findByFestivalNameContaining(String festivalName);
	

}
