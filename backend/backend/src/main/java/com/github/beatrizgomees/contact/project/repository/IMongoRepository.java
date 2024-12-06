package com.github.beatrizgomees.contact.project.repository;

import com.github.beatrizgomees.contact.project.domain.ContactModel;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface IMongoRepository extends MongoRepository<ContactModel, String> {



}
