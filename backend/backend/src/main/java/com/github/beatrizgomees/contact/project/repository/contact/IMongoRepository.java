package com.github.beatrizgomees.contact.project.repository.contact;

import com.github.beatrizgomees.contact.project.domain.contact.Contact;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface IMongoRepository extends MongoRepository<Contact, String> {



}
