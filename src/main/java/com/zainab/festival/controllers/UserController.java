package com.zainab.festival.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.zainab.festival.models.LoginUser;
import com.zainab.festival.models.Review;
import com.zainab.festival.models.User;
import com.zainab.festival.services.ReviewService;
import com.zainab.festival.services.UserService;


@Controller
public class UserController {

	@Autowired 
	UserService uService; 
	
	@Autowired
	ReviewService rService;
	
	
		@GetMapping("/")
		public String home() {
			return "index.jsp"; 
			
		}

		// renders the login and registration page
		@GetMapping("/login")
		public String login(@ModelAttribute("user") User user, @ModelAttribute("loginUser") LoginUser loginUser ) {
			return "login.jsp";
		}
		
		
	
		//rendering the registration page
		@GetMapping("/registration")
		public String registration(@ModelAttribute("user") User user) {
			return "register.jsp";
		}
		
		
		//register a user
		@PostMapping("/register")
		public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult results, HttpSession session, @ModelAttribute("loginUser") LoginUser loginUser) {
			//validate user
			uService.validate(user, results);
			if(results.hasErrors()) {
				return "register.jsp";
			}
			//register user
			uService.regUser(user); 
			// put user in session
			session.setAttribute("loginUser", user);
			return "redirect:/dashboard";
		}

	
	//login
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult results, HttpSession session, @ModelAttribute("user") User user) {
		
		uService.authenticateUser(loginUser, results); 
		if(results.hasErrors()) {
			return "login.jsp"; 
		}
		User loggedInUser=uService.findByEmail(loginUser.getEmail()); 
		session.setAttribute("loginUser", loggedInUser); 
		return "redirect:/dashboard";
	}
	
	//logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "redirect:/";
	}
	
	//render dashboard
	@GetMapping("/dashboard") 
	public String dashboard(@ModelAttribute("review") Review review, Model model, HttpSession session) {
		
		if(session.getAttribute("loginUser")!=null) {
			User user =(User)session.getAttribute("loginUser"); 
			User userInSession = uService.findById(user.getId()); 
			model.addAttribute("userInSession", userInSession); 
			model.addAttribute("allReviews", rService.allReviews()); 
			return "dashboard.jsp";
		}
		return "redirect:/";
	}
}
