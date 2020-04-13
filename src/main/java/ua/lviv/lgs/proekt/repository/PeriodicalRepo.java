package ua.lviv.lgs.proekt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.proekt.domain.User;

public interface PeriodicalRepo  extends JpaRepository<User, Integer>  {

}
