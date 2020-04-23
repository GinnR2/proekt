package ua.lviv.lgs.proekt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.proekt.repository.BucketRepo;
import ua.lviv.lgs.proekt.domain.Bucket;

@Service
public class BucketService {

	@Autowired
	private BucketRepo repo;

	public List<Bucket> getAll() {
		return repo.findAll();
	}

	public void delete(Bucket bucket) {
		repo.delete(bucket);
	}

	public Bucket add(Bucket bucket) {
		return repo.save(bucket);
	}
}