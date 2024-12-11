package com.github.beatrizgomees.contact.project.repository.user;

import com.github.beatrizgomees.contact.project.domain.user.User;
import com.github.beatrizgomees.contact.project.domain.user.UserDAO;

public interface IUserRepository {
    void save(User user);
}
