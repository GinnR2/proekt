package ua.lviv.lgs.proekt.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.domain.User;
import ua.lviv.lgs.proekt.domain.UserRole;
import ua.lviv.lgs.proekt.repository.UserRepo;


@Service
public class UserService{
	private Logger log = LoggerFactory.getLogger(UserService.class);
	
    @Autowired
    private UserRepo repo;
    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setConfirm(bCryptPasswordEncoder.encode(user.getConfirm()));
        user.setRole(UserRole.ROLE_USER);
        repo.save(user);
        log.info("Registered new User "+user);
    }
    
    public User getByEmail(String email) {
    	User u = repo.findByEmail(email).get();
    	log.info("Got " + u);
    	
    	return u;
    }
}