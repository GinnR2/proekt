package ua.lviv.lgs.proekt.controller;

import java.util.Date;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.proekt.domain.Bucket;
import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.domain.User;
import ua.lviv.lgs.proekt.service.BucketService;
import ua.lviv.lgs.proekt.service.PeriodicalService;
import ua.lviv.lgs.proekt.service.UserService;

@Controller
public class BucketController {
	@Autowired
	private BucketService bucketService;

	@Autowired
	private UserService userService;

	@Autowired
	private PeriodicalService periodicalsService;
	
	@RequestMapping(value = "/bucket", method = RequestMethod.GET)
	public ModelAndView getAllItems() {
		return getBucketItems();
	}
	
	@RequestMapping(value = "/bucketAdd", method = RequestMethod.POST)
	public ModelAndView create(@RequestParam(name="id") String id) {
		Periodical periodical = periodicalsService.get(Integer.parseInt(id));

		Bucket bucket = new Bucket();
		bucket.setPeriodical(periodical);
		bucket.setPurchaseDate(new Date());

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		User user = userService.getByEmail(userEmail);
		bucket.setUser(user);

		bucketService.add(bucket);
		return new ModelAndView("redirect:/bucket");
	}

	@RequestMapping(value = "/bucketRemove", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam(name="id") String id) {
		bucketService.delete(new Bucket(Integer.parseInt(id.replaceAll("\\s",""))));
		return getBucketItems();
	}
	
	private ModelAndView getBucketItems() {
		ModelAndView map = new ModelAndView("bucket");
		map.addObject("bucket", bucketService.getAll().stream().filter(x->x.getUser().getEmail()
				.equals(SecurityContextHolder.getContext().getAuthentication().getName()))
				.collect(Collectors.toList()));
		
		return map;
	}
}
