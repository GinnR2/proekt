package ua.lviv.lgs.proekt.controller;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.proekt.domain.FileMultipart;
import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.dto.PeriodicalDto;
import ua.lviv.lgs.proekt.service.FileMultipartService;
import ua.lviv.lgs.proekt.service.PeriodicalService;

@Controller
public class PeriodicalController {
	@Autowired
	private FileMultipartService fms;
	@Autowired
    private PeriodicalService service;
    @RequestMapping(value = "/createEnt", method = {RequestMethod.GET})
    public String create(Model model) {
        model.addAttribute("periodicalForm", new PeriodicalDto());
        return "createEnt";
    }
    @RequestMapping(value = "/createEnt", method = {RequestMethod.POST})
    public ModelAndView createEnt(@RequestParam("image") MultipartFile image, 
			@RequestParam String name, 
			@RequestParam String description, 
			@RequestParam Double price) throws IOException {
        
        Periodical periodical = new Periodical();
        //System.out.println(periodicalForm);
        periodical.setName(name);
        periodical.setDescription(description);
        periodical.setPrice(price);
        if(!image.isEmpty()) periodical.setImage(fms.saveFile(image));
        service.save(periodical);
        return new ModelAndView("redirect:/home");
    }
    @RequestMapping(value ="/home", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView map = new ModelAndView("home");
		map.addObject("periodicals", service.getAll());

		return map;
	}
    @GetMapping("/downloadFile/{fileId}")
	public ResponseEntity<Resource> downlaodFile(@PathVariable String fileId) throws FileNotFoundException {
		FileMultipart fileMultipart = fms.getFile(fileId);

		return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(fileMultipart.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileMultipart.getFileName() + "\"")
                .body(new ByteArrayResource(fileMultipart.getData()));
	}
}
