package com.github.beatrizgomees.contact.project.service;

import com.github.beatrizgomees.contact.project.domain.user.User;
import com.github.beatrizgomees.contact.project.domain.user.UserDAO;
import com.github.beatrizgomees.contact.project.domain.user.UserDTO;
import com.github.beatrizgomees.contact.project.domain.user.UserMapper;
import com.github.beatrizgomees.contact.project.repository.user.IMongoRepositoryUser;
import com.github.beatrizgomees.contact.project.repository.user.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserRepository {

    private final UserMapper userMapper;
    private final IMongoRepositoryUser mongoRepositoryUser;

    @Autowired
    public UserService(IMongoRepositoryUser mongoRepositoryUser, UserMapper userMapper) {
        this.userMapper = userMapper;
        this.mongoRepositoryUser = mongoRepositoryUser;
    }


    public void convertUserDTOToUser(UserDTO userDTO) {
        if (userDTO == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        try{
            User user = userMapper.convertUserDTOToUser(userDTO);
            save(user);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void save(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        try{
            UserDAO userDAO = userMapper.convertUserToUserDAO(user);
            mongoRepositoryUser.save(userDAO);
        }catch (Exception e){
            throw new RuntimeException("Failed to save user: " + e.getMessage(), e);
        }

    }
}
