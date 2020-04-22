package ua.lviv.lgs.proekt.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import ua.lviv.lgs.proekt.domain.FileMultipart;
import ua.lviv.lgs.proekt.repository.FileMultipartRepo;

@Service
public class FileMultipartService {
	
	@Autowired
	private FileMultipartRepo repo;
	
	public FileMultipart saveFile(MultipartFile file) throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		FileMultipart multipart = null;

		if (!fileName.contains("..")) {
			multipart = new FileMultipart(fileName, file.getContentType(), file.getBytes());
		}

		return repo.save(multipart);
		
	}
	
	public FileMultipart getFile(String fileId) throws FileNotFoundException {
		return repo.findById(fileId).orElseThrow(() -> new FileNotFoundException("File not found with Id =" + fileId));
	}
	
	
}
