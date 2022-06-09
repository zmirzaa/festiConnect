package com.zainab.festival.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zainab.festival.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long>  {

}
