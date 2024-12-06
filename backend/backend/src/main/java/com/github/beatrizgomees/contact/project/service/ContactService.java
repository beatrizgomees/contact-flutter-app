package com.github.beatrizgomees.contact.project.service;

import com.github.beatrizgomees.contact.project.domain.ContactModel;
import com.github.beatrizgomees.contact.project.repository.IContactRepository;
import com.github.beatrizgomees.contact.project.repository.IMongoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ContactService implements IContactRepository {


    private IMongoRepository mongoRepository;

    @Autowired
    public ContactService(IMongoRepository mongoRepository) {
        this.mongoRepository = mongoRepository;
    }

    @Override
    public ContactModel findByEmail(String email) {
        return null;
    }

    @Override
    public void create(ContactModel contactModel) {
      fieldCheck(contactModel);
        try{
            mongoRepository.save(contactModel);

        }catch (Exception e){
            e.printStackTrace();
        }
    }


    @Override
    public void update(ContactModel contactModel) {

    }

    @Override
    public void delete(ContactModel contactModel) {

    }

    @Override
    public ContactModel readByPhone(String phone) {
        return null;
    }


    private void fieldCheck(ContactModel contactModel) {

        Optional.ofNullable(contactModel)
                .orElseThrow(() -> new IllegalArgumentException("Contact object is null"));

        Optional.ofNullable(contactModel.getName())
                .filter(name -> !name.isEmpty())
                .orElseThrow(() -> new IllegalArgumentException("Contact name is required"));

        Optional.ofNullable(contactModel.getEmail())
                .filter(email -> !email.isEmpty())
                .orElseThrow(() -> new IllegalArgumentException("Email is invalid"));

//        Optional.ofNullable(contactModel.getPhone())
//                .filter(phone -> phone.matches("\\d{10}"))
//                .orElseThrow(() -> new IllegalArgumentException("Phone number must be 10 digits"));

        Optional.ofNullable(contactModel.getObjectId())
                .filter(objectId -> !objectId.isEmpty())
                .orElseThrow(() -> new IllegalArgumentException("Object ID must be present"));
    }
}
