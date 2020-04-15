package ua.lviv.lgs.proekt.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.proekt.domain.User;

public interface UserRepo  extends JpaRepository<User, Integer> {
	Optional<User> findByEmail(String email);
}
