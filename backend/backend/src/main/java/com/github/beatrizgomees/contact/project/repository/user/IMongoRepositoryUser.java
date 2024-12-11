package com.github.beatrizgomees.contact.project.repository.user;

import com.github.beatrizgomees.contact.project.domain.user.UserDAO;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface IMongoRepositoryUser extends MongoRepository<UserDAO, String> {
}
