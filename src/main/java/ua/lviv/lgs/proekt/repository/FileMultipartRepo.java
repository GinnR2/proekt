package ua.lviv.lgs.proekt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.lviv.lgs.proekt.domain.FileMultipart;

@Repository
public interface FileMultipartRepo extends JpaRepository<FileMultipart, String> {

}
