package ua.lviv.lgs.proekt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.lviv.lgs.proekt.domain.User;
import ua.lviv.lgs.proekt.service.UserService;

@Controller
public class UserController {
	@Autowired
    private UserService userService;
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
    	//String name = bindingResult.getFieldValue("name").toString();
    	//String surname = bindingResult.getFieldValue("surname").toString();
    	String email = bindingResult.getFieldValue("email").toString();
    	String password = bindingResult.getFieldValue("password").toString();
    	String confirm = bindingResult.getFieldValue("confirm").toString();

    	if (bindingResult.hasErrors()) {
            return "registration";
        }
        
        if (!confirm.equals(password)) {
        	bindingResult.addError(new FieldError("registration", "confirm", "Passwords not equals."));
        	return "registration";
        }
        
        if (userService.getByEmail(email)!=null) {
        	bindingResult.addError(new FieldError("registration","email", "This user exists."));
        	return "registration";
        }
        userService.save(userForm);
        return "redirect:/login";
    }
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) model.addAttribute("error", "Wrong username or password.");
        if (logout != null) model.addAttribute("message", "Logged out.");
        return "login";
    }
    

}
