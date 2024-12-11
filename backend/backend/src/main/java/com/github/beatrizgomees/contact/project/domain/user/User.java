package com.github.beatrizgomees.contact.project.domain.user;


import lombok.*;
import org.springframework.data.mongodb.core.mapping.Document;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Document("users")
@Data
public class User {

    private String email;
    private String password;
    private String token;

}
