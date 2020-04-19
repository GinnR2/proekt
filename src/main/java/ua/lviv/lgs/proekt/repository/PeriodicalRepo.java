package ua.lviv.lgs.proekt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.domain.User;

public interface PeriodicalRepo  extends JpaRepository<Periodical, Integer>  {

	void save(User user);

}
