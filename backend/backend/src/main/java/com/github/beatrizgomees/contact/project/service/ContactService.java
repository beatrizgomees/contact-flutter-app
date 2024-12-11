//package com.github.beatrizgomees.contact.project.service;
//
//import com.github.beatrizgomees.contact.project.domain.contact.Contact;
//import com.github.beatrizgomees.contact.project.repository.contact.IContactRepository;
//import org.springframework.stereotype.Service;
//
//import java.util.Optional;
//
//@Service
//public class ContactService implements IContactRepository {
//
//
//
//    private void fieldCheck(Contact contactModel) {
//
//        Optional.ofNullable(contactModel)
//                .orElseThrow(() -> new IllegalArgumentException("Contact object is null"));
//
//        Optional.ofNullable(contactModel.getName())
//                .filter(name -> !name.isEmpty())
//                .orElseThrow(() -> new IllegalArgumentException("Contact name is required"));
//
//        Optional.ofNullable(contactModel.getEmail())
//                .filter(email -> !email.isEmpty())
//                .orElseThrow(() -> new IllegalArgumentException("Email is invalid"));
//
////        Optional.ofNullable(contactModel.getPhone())
////                .filter(phone -> phone.matches("\\d{10}"))
////                .orElseThrow(() -> new IllegalArgumentException("Phone number must be 10 digits"));
//
//        Optional.ofNullable(contactModel.getObjectId())
//                .filter(objectId -> !objectId.isEmpty())
//                .orElseThrow(() -> new IllegalArgumentException("Object ID must be present"));
//    }
//}
