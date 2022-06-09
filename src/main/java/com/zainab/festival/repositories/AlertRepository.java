package com.zainab.festival.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.zainab.festival.models.Alert;

public interface AlertRepository extends CrudRepository<Alert, Long>  {
	List<Alert> findAll(); 

}
