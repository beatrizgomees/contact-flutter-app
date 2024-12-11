package com.github.beatrizgomees.contact.project.repository.contact;

import com.github.beatrizgomees.contact.project.domain.contact.Contact;

public interface IContactRepository {

    Contact findByEmail(String email);
    void create(Contact contactModel);
    void update(Contact contactModel);
    void delete(Contact contactModel);
    Contact readByPhone(String phone);
}
