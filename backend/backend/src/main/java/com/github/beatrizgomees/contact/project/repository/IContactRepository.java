package com.github.beatrizgomees.contact.project.repository;

import com.github.beatrizgomees.contact.project.domain.ContactModel;

import java.util.Optional;

public interface IContactRepository {

    ContactModel findByEmail(String email);
    void create(ContactModel contactModel);
    void update(ContactModel contactModel);
    void delete(ContactModel contactModel);
    ContactModel readByPhone(String phone);
}
