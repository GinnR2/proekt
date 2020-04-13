package ua.lviv.lgs.proekt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.proekt.domain.User;

public interface UserRepo  extends JpaRepository<User, Integer> {
	List<User> findByEmail(String email);
}
