package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController extends SuperController{
    
    @RequestMapping("/contact")
    public ModelAndView getContactPage() {
        return new ModelAndView("contact");
    }
}
