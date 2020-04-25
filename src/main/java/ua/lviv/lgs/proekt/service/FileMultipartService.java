package ua.lviv.lgs.proekt.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import ua.lviv.lgs.proekt.domain.FileMultipart;
import ua.lviv.lgs.proekt.repository.FileMultipartRepo;

@Service
public class FileMultipartService {
	private Logger log = LoggerFactory.getLogger(FileMultipartService.class);
	
	@Autowired
	private FileMultipartRepo repo;
	
	public FileMultipart saveFile(MultipartFile file) throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		FileMultipart multipart = null;

		if (!fileName.contains("..")) {
			multipart = new FileMultipart(fileName, file.getContentType(), file.getBytes());
		}
		repo.save(multipart);
		log.info("Saved file: "+multipart.getFileName());
		return multipart;
		
	}
	
	public FileMultipart getFile(String id) throws FileNotFoundException {
		FileMultipart multipart = repo.findById(id).orElseThrow(() -> new FileNotFoundException("File not found with Id =" + id));
		//log.info("Got file: "+multipart.getFileName());
		return multipart;
	}
	
	
}
