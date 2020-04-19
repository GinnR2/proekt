package ua.lviv.lgs.proekt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.proekt.domain.Periodical;
import ua.lviv.lgs.proekt.service.PeriodicalService;

@Controller
public class PeriodicalController {
	@Autowired
    private PeriodicalService service;
    @RequestMapping(value = "/createEnt", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("periodicalForm", new Periodical());
        return "createEnt";
    }
    @RequestMapping(value = "/createEnt", method = RequestMethod.POST)
    public String registration(@ModelAttribute("periodicalForm") Periodical periodicalForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "createEnt";
        }
        service.save(periodicalForm);
        return "redirect:/home";
    }
    @RequestMapping(value ="/home", method = RequestMethod.GET)
	public ModelAndView welcome2() {
		ModelAndView map = new ModelAndView("home");
		map.addObject("periodicals", service.getAll());

		return map;
	}
    
}
