package com.zainab.festival.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zainab.festival.models.Alert;
import com.zainab.festival.repositories.AlertRepository;

@Service
public class AlertService {
	
	@Autowired
	private AlertRepository aRepo; 
	
	public List<Alert> allAlerts() {
		return aRepo.findAll(); 
		
	}
	
	public Alert createAlert(Alert alert) {
		return aRepo.save(alert); 
	}
	
	
	public void delete(Long id) {
		aRepo.deleteById(id);
	}
	
	public Alert getOneAlert(Long id) {
		return aRepo.findById(id).orElse(null); 
	}
	
	public Alert update(Alert alert) {
		return aRepo.save(alert); 
	}
	
	public List<Alert> findByFestivalName(String festivalName) {
		return aRepo.findByFestivalNameContaining(festivalName);
	}
	
}
