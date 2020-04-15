package ua.lviv.lgs.proekt.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.domain.User;
import ua.lviv.lgs.proekt.domain.UserRole;
import ua.lviv.lgs.proekt.repository.UserRepo;


@Service
public class UserService{
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setConfirm(bCryptPasswordEncoder.encode(user.getConfirm()));
        user.setRole(UserRole.ROLE_USER);
        userRepo.save(user);
    }
}