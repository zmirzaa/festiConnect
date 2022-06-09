package com.zainab.festival.repositories;
import org.springframework.data.repository.CrudRepository;

import com.zainab.festival.models.User;


public interface UserRepository extends CrudRepository<User, Long> {
	
	User findByEmail(String email);

}
