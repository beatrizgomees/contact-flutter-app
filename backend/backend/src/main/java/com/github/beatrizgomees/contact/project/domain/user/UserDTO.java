package com.github.beatrizgomees.contact.project.domain.user;


public record UserDTO(
        String email,
        String password,
        String token) {
}
