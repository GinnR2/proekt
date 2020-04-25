package ua.lviv.lgs.proekt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.repository.BucketRepo;
import ua.lviv.lgs.proekt.domain.Bucket;

@Service
public class BucketService {
	private Logger log = LoggerFactory.getLogger(BucketService.class);
	
	@Autowired
	private BucketRepo repo;

	public List<Bucket> getAll() {
		List<Bucket> list = repo.findAll();
		log.info("Got "+list.size()+" Bucket entities");
		return list;
	}

	public Bucket delete(Bucket bucket) {
		repo.delete(bucket);
		log.info("Deleted "+bucket);
		return bucket;
	}

	public Bucket add(Bucket bucket) {
		repo.save(bucket);
		log.info(" Added "+bucket.getPeriodical()+" to "+bucket.getUser().getEmail()+"'s bucket");
		return bucket;
	}
}