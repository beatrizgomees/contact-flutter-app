//package com.github.beatrizgomees.contact.project.controller;
//
//import com.github.beatrizgomees.contact.project.domain.contact.Contact;
//import com.github.beatrizgomees.contact.project.service.ContactService;
//import com.google.firebase.auth.FirebaseAuth;
//import com.google.firebase.auth.FirebaseToken;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//@Controller
//@RequestMapping("/api/v1/")
//public class ContactController {
//
//    private final ContactService contactService;
//
//
//    @Autowired
//    public ContactController(ContactService contactService) {
//        this.contactService = contactService;
//    }
//
//    @PostMapping
//    public ResponseEntity<String> createContact(
//            @RequestHeader("authorization") String authHeader,
//            @RequestBody Contact contactModel){
//        try{
//            String idToken = authHeader.replace("Bearer ", "");
//            FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(idToken);
//
//            String uid = decodedToken.getUid();
//
//            contactService.create(contactModel);
//            return ResponseEntity.status(HttpStatus.CREATED).body("Contact created");
//        }catch (Exception e){
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error processing request");
//        }
//
//    }
//
//
//}
