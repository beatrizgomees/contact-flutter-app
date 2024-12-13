package com.github.beatrizgomees.contact.project.controller;
import com.github.beatrizgomees.contact.project.domain.user.UserDTO;
import com.github.beatrizgomees.contact.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/v1/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
    this.userService = userService;
    }

    @PostMapping
    public ResponseEntity<String> saveUser(UserDTO userDTO) {
        try{
            userService.convertUserDTOToUser(userDTO);
            return ResponseEntity.status(HttpStatus.CREATED).body("Contact created");

        }catch (Exception e) {
            throw new RuntimeException("Failed to save user: " + e.getMessage(), e);
        }
    }
}
