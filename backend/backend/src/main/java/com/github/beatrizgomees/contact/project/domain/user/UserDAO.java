package com.github.beatrizgomees.contact.project.domain.user;


public record UserDAO(
        String email,
        String password,
        String token) {
}
