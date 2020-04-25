package ua.lviv.lgs.proekt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.repository.PeriodicalRepo;

@Service
public class PeriodicalService {
	private Logger log = LoggerFactory.getLogger(PeriodicalService.class);

	@Autowired
	private PeriodicalRepo repo;

	public Periodical save(Periodical ent) {
		repo.save(ent);
		log.info("Saved "+ent);
		return ent;
	}
	
	public List<Periodical> getAll() {
		List<Periodical> list = repo.findAll();
		log.info("Got "+list.size()+" Periodical entities");
		return list;
	}
	
	public Periodical get(Integer id) {
		Periodical p = repo.findById(id).get();
		log.info("Got "+p);
		return p;
	}
}