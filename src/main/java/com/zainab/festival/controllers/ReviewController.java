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
import com.zainab.festival.models.Comment;
import com.zainab.festival.models.Review;
import com.zainab.festival.models.User;
import com.zainab.festival.services.AlertService;
import com.zainab.festival.services.ReviewService;
import com.zainab.festival.services.UserService;

@Controller
public class ReviewController {
	
	@Autowired 
	UserService uService; 
	
	@Autowired
	ReviewService rService;
	
	@Autowired
	AlertService aService;

	
	@PostMapping("/createReview") 
	public String add(@Valid @ModelAttribute("review") Review review, BindingResult results, @ModelAttribute("alert") Alert alert, 
			Model model, HttpSession session){
		
		if(results.hasErrors()) {
			User user =(User)session.getAttribute("loginUser"); 
			User userInSession = uService.findById(user.getId()); 
			model.addAttribute("alerts", aService.allAlerts()); 
			model.addAttribute("userInSession", userInSession); 
			model.addAttribute("allReviews", rService.allReviews());
			return "dashboard.jsp"; 
			
		} else {
			rService.createReview(review);
			return "redirect:/review/" + review.getId();
		}
	}
	
	@GetMapping("/review/{id}")
	public String view(@PathVariable Long id, Model model, HttpSession session, @ModelAttribute("comment") Comment comment) { 
		
		if(session.getAttribute("loginUser")!=null) {
			Review review = rService.getOneReview(id); 
			User user =(User)session.getAttribute("loginUser"); 
			User userInSession = uService.findById(user.getId());
			model.addAttribute("review", review); 
			model.addAttribute("userInSession", userInSession);
			return "viewReview.jsp"; 
		}
		
		else {
			Review review = rService.getOneReview(id); 
			model.addAttribute("review", review); 
			return "nonUserReview.jsp";
		}
		
	}
	
	
	
	@GetMapping("/likeReview/{id}") 
	public String like(@PathVariable Long id, HttpSession session) {
		Review review=rService.getOneReview(id);
		User user=(User)session.getAttribute("loginUser"); 
		User UserLiking=uService.findById(user.getId()); 
		rService.like(review, UserLiking); 
		return "redirect:/review/" + review.getId(); 
	}
	
	
	@PostMapping("/addComment")
	public String addComment(@Valid @ModelAttribute("comment") Comment comment, 
			BindingResult results, Model model) {
		if (results.hasErrors() ) {
			return "viewReview.jsp";
			
		} else {
			rService.addComment(comment);
			return "redirect:/review/" + comment.getReviewComment().getId(); 
		}
		
		
	}
	
	
	@GetMapping("/search/{festivalName}")
	public String search(@PathVariable("festivalName") String festivalName, Model model, HttpSession session) {
		if(session.getAttribute("loginUser")!=null) {
		List<Review> reviews = rService.findByFestivalName(festivalName);
		model.addAttribute("reviews", reviews);
		return "allReviews.jsp";
	} else {
		List<Review> reviews = rService.findByFestivalName(festivalName);
		model.addAttribute("reviews", reviews);
		return "nonUserAllReviews.jsp";
	}
		
	}
	
	
	
	@PostMapping("/searchReview")
	public String searchReview(@RequestParam("festivalName") String festivalName, Model model) {
		model.addAttribute("festivalName", festivalName);
		return "redirect:/search/"+festivalName;
	}
	
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		rService.delete(id);
		return "redirect:/dashboard";
	}
	
	

}
