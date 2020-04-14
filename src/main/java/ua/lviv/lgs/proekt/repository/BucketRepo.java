package ua.lviv.lgs.proekt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.proekt.domain.Bucket;

public interface BucketRepo  extends JpaRepository<Bucket, Integer>  {

}
