package com.zainab.festival.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zainab.festival.models.Alert;
import com.zainab.festival.models.Review;
import com.zainab.festival.models.User;
import com.zainab.festival.services.AlertService;
import com.zainab.festival.services.ReviewService;
import com.zainab.festival.services.UserService;

@Controller
public class AlertController {
	
	@Autowired
	private AlertService aService; 
	
	@Autowired
	private UserService uService; 
	
	@Autowired
	private ReviewService rService; 
	
	
	@PostMapping("/createAlert") 
	public String add(@Valid @ModelAttribute("alert") Alert alert, BindingResult results, @ModelAttribute("review") Review review,
			Model model, HttpSession session){
		
		if(results.hasErrors()) {
			User user =(User)session.getAttribute("loginUser"); 
			User userInSession = uService.findById(user.getId()); 
			model.addAttribute("alerts", aService.allAlerts());
			model.addAttribute("userInSession", userInSession); 
			model.addAttribute("allReviews", rService.allReviews());
			return "dashboard.jsp"; 
			
		} else {
			aService.createAlert(alert);
			return "redirect:/dashboard"; 
		}
	}

	
	
	
	@GetMapping("/search/alert/{festivalName}")
	public String search(@PathVariable("festivalName") String festivalName, Model model, HttpSession session) {
		if(session.getAttribute("loginUser")!=null) {
		List<Alert> alerts = aService.findByFestivalName(festivalName);
		model.addAttribute("alerts", alerts);
		return "alerts.jsp";
		} 
		
		else {
			List<Alert> alerts = aService.findByFestivalName(festivalName);
			model.addAttribute("alerts", alerts);
			return "nonUserAlerts.jsp";
			
		}
	}
	
	
	@PostMapping("/searchAlert")
	public String searchAlert(@RequestParam("festivalName") String festivalName, Model model) {
		model.addAttribute("festivalName", festivalName);
		return "redirect:/search/alert/"+festivalName;
	}
	
	
	
	@DeleteMapping("/delete/alert/{id}")
	public String delete(@PathVariable Long id) {
		aService.delete(id);
		return "redirect:/dashboard";
	}
	
	
}
