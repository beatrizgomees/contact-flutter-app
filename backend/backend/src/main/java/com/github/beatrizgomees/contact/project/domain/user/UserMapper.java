package com.github.beatrizgomees.contact.project.domain.user;

import org.springframework.stereotype.Component;

@Component
public class UserMapper {

    public User convertUserDTOToUser(UserDTO userDTO){
        User user = new User();
        try {
            user.setEmail(userDTO.email());
            user.setPassword(userDTO.password());
            user.setToken(user.getToken());

        } catch (NullPointerException e){
          e.printStackTrace();
        }
        
        return user;
    }


    public UserDAO convertUserToUserDAO(User user){
        UserDAO userDAO = null;
        try{
            userDAO = new UserDAO(
                    user.getEmail(),
                    user.getPassword(),
                    user.getToken());
        }catch (Exception e){
            e.printStackTrace();
        }
        return userDAO;
    }
}
