package ua.lviv.lgs.proekt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.repository.PeriodicalRepo;

@Service
public class PeriodicalService {
	@Autowired
	private PeriodicalRepo repo;

	public void save(Periodical ent) {
		repo.save(ent);
	}
	
	public List<Periodical> getAll() {
		return repo.findAll();
	}
	
	public Periodical get(Integer id) {
		return repo.findById(id).get();
	}
}