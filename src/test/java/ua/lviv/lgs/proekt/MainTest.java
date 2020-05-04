package ua.lviv.lgs.proekt;

import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.Assert.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

import ua.lviv.lgs.proekt.domain.Bucket;
import ua.lviv.lgs.proekt.domain.FileMultipart;
import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.domain.User;
import ua.lviv.lgs.proekt.domain.UserRole;
import ua.lviv.lgs.proekt.repository.BucketRepo;
import ua.lviv.lgs.proekt.repository.FileMultipartRepo;
import ua.lviv.lgs.proekt.repository.PeriodicalRepo;
import ua.lviv.lgs.proekt.repository.UserRepo;
import ua.lviv.lgs.proekt.service.BucketService;
import ua.lviv.lgs.proekt.service.FileMultipartService;
import ua.lviv.lgs.proekt.service.PeriodicalService;
import ua.lviv.lgs.proekt.service.UserService;
//import static org.junit.Assert.assertTrue;
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureTestDatabase
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class MainTest {
	@Autowired
	private UserService userService;
	
	@Autowired
	private PeriodicalService periodicalService;
	
	@Autowired
	private BucketService bucketService;
	
	@Autowired
	private FileMultipartService fms;


	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private PeriodicalRepo periodicalRepo;
	
	@Autowired
	private BucketRepo bucketRepo;
	
	@Autowired
	private FileMultipartRepo fmr;
	
	User user = new User("1@gmail.com","1","1","1","1");
	Periodical periodical = new Periodical("11", "11", 4.2);

		
	@Test
	public void testSaveUser() {
		
		user.setRole(UserRole.ROLE_USER);
		userService.save(user);
		List<User> users = userRepo.findAll();
		assertThat(users,hasSize(1));
	}
	
	@Test
	public void testGetUser() {
		userService.save(user);
		assertTrue(userService.getByEmail("1@gmail.com").equals(user));
	}
	
	@Test
	public void testSavePeriodical() {
		periodicalService.save(periodical);
		List<Periodical> pers = periodicalRepo.findAll();
		assertThat(pers,hasSize(1));
	}
	
	@Test
	public void testGetPeriodical() {
		periodicalService.save(periodical);
		assertTrue(periodicalService.get(1).equals(periodical));
	}
	
	@Test
	public void testGetAllPeriodicals() {
		periodicalService.save(periodical);
		assertTrue(periodicalService.getAll().equals(periodicalRepo.findAll()));
	}

	@Test
	public void testSaveBucket() {
		user.setRole(UserRole.ROLE_USER);
		userService.save(user);
		periodicalService.save(periodical);
		bucketService.add(new Bucket(userService.getByEmail("1@gmail.com"),periodicalService.get(1),new Date(81L)));
		List<Bucket> vidro = bucketRepo.findAll();
		assertThat(vidro,hasSize(1));
	}
	
	@Test
	public void testGetAllBuckets() {
		user.setRole(UserRole.ROLE_USER);
		userService.save(user);
		periodicalService.save(periodical);
		bucketService.add(new Bucket(userService.getByEmail("1@gmail.com"),periodicalService.get(1),new Date(81L)));
		List<Bucket> vidro = bucketService.getAll();
		assertThat(vidro,hasSize(1));
	}
	
	@Test
	public void testDeleteBucket() {
		user.setRole(UserRole.ROLE_USER);
		userService.save(user);
		periodicalService.save(periodical);
		bucketService.add(new Bucket(userService.getByEmail("1@gmail.com"),periodicalService.get(1),new Date(81L)));
		bucketService.delete(new Bucket(1));
		List<Bucket> vidro = bucketRepo.findAll();
		assertThat(vidro,hasSize(0));
	}
	
	@Test
	public void testSaveFile() throws IOException {
		String name = "file.txt";
		String originalFileName = "file.txt";
		String contentType = "text/plain";
		byte[] content = {1,1,1,1,1,1,1,1};
		MultipartFile file = new MockMultipartFile(name,originalFileName,contentType,content);
		fms.saveFile(file);
		List<FileMultipart> files = fmr.findAll();
		assertThat(files,hasSize(1));
	}
	
	@Test
	public void testGetFile() throws IOException, InterruptedException {
		String name = "file.txt";
		String originalFileName = "file.txt";
		String contentType = "text/plain";
		byte[] content = {1,1,1,1,1,1,1,1};
		MultipartFile file = new MockMultipartFile(name,originalFileName,contentType,content);
		fms.saveFile(file);
		List<FileMultipart> files = fmr.findAll();
		assertTrue(Arrays.equals(fms.getFile(files.get(0).getId()).getData(),content));
	}
	
}
